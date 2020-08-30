//
//  GroceriesViewModel.swift
//  Nutritions
//
//  Created by Ramill Ibragimov on 30.08.2020.
//

import SwiftUI

class GroceriesViewModel: NSObject, ObservableObject {
    
    @AppStorage("groceries") static var groceriesJSON = ""
    @Published var groceries: [Grocery] = []
    
    var foodArray: [String] {
        groceries.filter{$0.category == .food}.map{$0.name}
    }

    
    func newFoodItem(_ newItem: String) {
        groceries.append(Grocery(name: newItem, category: .food))
        GroceriesViewModel.storeGroceries(groceries: groceries)
    }

    
    
    override init() {
        groceries = GroceriesViewModel.retriveGroceries()
    }
    
    // Static functions for managing persistence
    static func retriveGroceries() -> [Grocery] {
        if groceriesJSON != "" {
            let decoder = JSONDecoder()
            let data = Data(groceriesJSON.utf8)
            guard let groceries = try? decoder.decode([Grocery].self, from: data) else {
                fatalError("Failed to decode JSON from data")
            }
            return groceries
        } else {
            GroceriesViewModel.storeGroceries(groceries: GroceriesViewModel.sampleGroceries)
            return GroceriesViewModel.sampleGroceries
        }
    }
    
    static func storeGroceries(groceries: [Grocery]) {
        let encoder = JSONEncoder()
        guard let jsonData = try? encoder.encode(groceries) else {
            fatalError("Unable to encode data")
        }
        GroceriesViewModel.groceriesJSON = String(data: jsonData, encoding: .utf8)!
    }
    
    // Sample data for first launch
    static let sampleGroceries: [Grocery] = [
        Grocery(name: "Apples", category: .food),
        Grocery(name: "Oranges", category: .food),
        Grocery(name: "Bread", category: .food),
        Grocery(name: "Eggs", category: .food),
        Grocery(name: "Milk", category: .food),
        Grocery(name: "Cola", category: .food),
        Grocery(name: "Orange Juice", category: .food),
        Grocery(name: "Tea", category: .food),
        Grocery(name: "Coffee", category: .food),
    ]
    
}
