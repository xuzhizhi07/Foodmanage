import SwiftUI

struct FoodListView: View {
    @StateObject private var viewModel = FoodViewModel()
    @State private var showingAddFood = false
    
    var body: some View {
        NavigationView {
            VStack {
                // 搜索栏
                SearchBar(text: $viewModel.searchText)
                
                // 分类选择器
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(FoodCategory.allCases, id: \.self) { category in
                            CategoryButton(
                                category: category,
                                isSelected: viewModel.selectedCategory == category,
                                action: {
                                    viewModel.selectedCategory = viewModel.selectedCategory == category ? nil : category
                                }
                            )
                        }
                    }
                    .padding(.horizontal)
                }
                
                // 食物列表
                List {
                    ForEach(viewModel.filteredFoods) { food in
                        FoodRow(food: food)
                    }
                    .onDelete(perform: viewModel.deleteFood)
                }
            }
            .navigationTitle("我的冰箱")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddFood = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddFood) {
                AddFoodView(viewModel: viewModel)
            }
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("搜索食物...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding(.horizontal)
    }
}

struct CategoryButton: View {
    let category: FoodCategory
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(category.rawValue)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(isSelected ? .white : .primary)
                .cornerRadius(20)
        }
    }
}

struct FoodRow: View {
    let food: Food
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(food.name)
                    .font(.headline)
                Spacer()
                Text("\(food.quantity) \(food.unit)")
                    .font(.subheadline)
            }
            
            HStack {
                Text(food.category.rawValue)
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
                Text("过期: \(food.expiryDate.formatted(date: .abbreviated, time: .omitted))")
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    FoodListView()
} 