import Foundation
import Combine

class FoodViewModel: ObservableObject {
    @Published var foods: [Food] = []
    @Published var selectedCategory: FoodCategory?
    @Published var searchText: String = ""
    
    var filteredFoods: [Food] {
        var filtered = foods
        
        if let category = selectedCategory {
            filtered = filtered.filter { $0.category == category }
        }
        
        if !searchText.isEmpty {
            filtered = filtered.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
        
        return filtered
    }
    
    func addFood(_ food: Food) {
        foods.append(food)
    }
    
    func updateFood(_ food: Food) {
        if let index = foods.firstIndex(where: { $0.id == food.id }) {
            foods[index] = food
        }
    }
    
    func deleteFood(_ food: Food) {
        foods.removeAll { $0.id == food.id }
    }
    
    func deleteFood(at offsets: IndexSet) {
        foods.remove(atOffsets: offsets)
    }
} 