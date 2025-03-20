import Foundation

struct Food: Identifiable, Codable {
    let id: UUID
    var name: String
    var quantity: Double
    var unit: String
    var purchaseDate: Date
    var expiryDate: Date
    var category: FoodCategory
    var notes: String?
    
    init(id: UUID = UUID(), name: String, quantity: Double, unit: String, purchaseDate: Date = Date(), expiryDate: Date, category: FoodCategory, notes: String? = nil) {
        self.id = id
        self.name = name
        self.quantity = quantity
        self.unit = unit
        self.purchaseDate = purchaseDate
        self.expiryDate = expiryDate
        self.category = category
        self.notes = notes
    }
}

enum FoodCategory: String, Codable, CaseIterable {
    case meat = "肉类"
    case vegetable = "蔬菜"
    case fruit = "水果"
    case dairy = "乳制品"
    case seafood = "海鲜"
    case other = "其他"
} 