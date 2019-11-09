//
//  InventoryViewController.swift
//  Inventory
//
//  Created by Carmel Braga on 11/8/19.
//  Copyright © 2019 Carmel Braga. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController {

    let jsonFileName = "inventory"
    @IBOutlet weak var productsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         if let allProducts = InventoryLoader.load(jsonFileName: jsonFileName) {
                   var displayInfo = ""
                   displayInfo += "Status: \(allProducts.status)\n\n\n"

                   for product in allProducts.products {
                       displayInfo += "Inventory:\n"
                       displayInfo += "ID: \(product.id)\n"
                       displayInfo += "Category: \(product.category)\n"
                       displayInfo += "Title: \(product.title)\n"
                       displayInfo += "Price: \(product.price)\n"
                       displayInfo += "Quantity: \(product.stockedQuantity)\n\n"
                   }
                   productsTextView.text = displayInfo
               } else {
                   productsTextView.text = "Error."
               }

     }
    
    
}
