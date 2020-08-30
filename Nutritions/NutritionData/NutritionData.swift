//
//  NutritionData.swift
//  Nutritions
//
//  Created by Ramill Ibragimov on 30.08.2020.
//

// MARK: - NutritionData
struct NutritionData: Codable {
    let the1 : The1
    let resultCount, status: Int
    let msg, warning: String
    let queryTime: Int

    enum CodingKeys: String, CodingKey {
        case the1 = "1"
        case resultCount, status, msg, warning, queryTime
    }
}

// MARK: - The1
struct The1: Codable {
    let id: Int
    let ifc: String
    let userID: Int
    let src, code, name, moddate: String
    let cat: String
    let isLive: Bool
    let barcode: String
    let reporturl: String
    let photo: String
}

struct NutritionDataStatus: Codable {
    let status: Int
}
