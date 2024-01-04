//
//  ToyModel.swift
//  Wishlist
//
//  Created by Maëlys Callens on 04/01/2024.
//

import Foundation

struct Toy: Codable, Identifiable {
    let id = UUID()
    var name: String
    var info: String
    var category: String
    var img_url: String
    var price: Double
    var user_id: String
    //var user_id =  "63fark5bc079877f4ec47bc9"
    var date_created: String
}

