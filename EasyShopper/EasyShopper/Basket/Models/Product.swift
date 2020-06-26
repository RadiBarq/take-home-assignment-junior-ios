//
//  Product.swift
//  EasyShopper
//
//  Created by Morten Bek Ditlevsen on 11/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation

/// Product
struct Product: Decodable {
    
    /// Id
    var id: String
    
    /// Title
    var name: String
    
    /// Image URL
    var imageUrl: String
    
    // Retail Price
    var retailPrice: Int
}
