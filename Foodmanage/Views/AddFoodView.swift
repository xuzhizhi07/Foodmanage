import SwiftUI

struct AddFoodView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: FoodViewModel
    
    @State private var name = ""
    @State private var quantity = 1.0
    @State private var unit = "个"
    @State private var purchaseDate = Date()
    @State private var expiryDate = Date().addingTimeInterval(7 * 24 * 60 * 60)
    @State private var category = FoodCategory.other
    @State private var notes = ""
    
    let units = ["个", "克", "千克", "包", "盒", "瓶", "袋"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("基本信息")) {
                    TextField("食物名称", text: $name)
                    
                    HStack {
                        TextField("数量", value: $quantity, format: .number)
                            .keyboardType(.decimalPad)
                        
                        Picker("单位", selection: $unit) {
                            ForEach(units, id: \.self) { unit in
                                Text(unit).tag(unit)
                            }
                        }
                    }
                    
                    Picker("分类", selection: $category) {
                        ForEach(FoodCategory.allCases, id: \.self) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                }
                
                Section(header: Text("日期信息")) {
                    DatePicker("购买日期", selection: $purchaseDate, displayedComponents: .date)
                    DatePicker("过期日期", selection: $expiryDate, displayedComponents: .date)
                }
                
                Section(header: Text("备注")) {
                    TextEditor(text: $notes)
                        .frame(height: 100)
                }
            }
            .navigationTitle("添加食物")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("取消") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("保存") {
                        let food = Food(
                            name: name,
                            quantity: quantity,
                            unit: unit,
                            purchaseDate: purchaseDate,
                            expiryDate: expiryDate,
                            category: category,
                            notes: notes.isEmpty ? nil : notes
                        )
                        viewModel.addFood(food)
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }
}

#Preview {
    AddFoodView(viewModel: FoodViewModel())
} 