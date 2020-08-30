//
//  Grocery.swift
//  Nutritions
//
//  Created by Ramill Ibragimov on 30.08.2020.
//

import SwiftUI

struct Grocery: Identifiable, Codable {
    enum Category: String, Codable {
        case food
        case beverage
    }
    
    var id: UUID = UUID()
    var name: String
    var category: Category
}
