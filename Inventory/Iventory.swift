//
//  Iventory.swift
//  Inventory
//
//  Created by Carmel Braga on 11/8/19.
//  Copyright © 2019 Carmel Braga. All rights reserved.
//

import Foundation

struct Products: Codable {
    var status: String
    var products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case status
        case products
    }
}

struct Product: Codable {
    var id: Int
    var category: String
    var title: String
    var price: Double
    var stockedQuantity: Int
}


class InventoryLoader{
    
    class func load(jsonFileName: String) -> Products? {
        var allProducts: Products?
           let jsonDecoder = JSONDecoder()
           
           if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
              let jsonData = try? Data(contentsOf: jsonFileUrl) {
                   allProducts = try? jsonDecoder.decode(Products.self, from: jsonData)
           }
           
           return allProducts
       }
    
}
