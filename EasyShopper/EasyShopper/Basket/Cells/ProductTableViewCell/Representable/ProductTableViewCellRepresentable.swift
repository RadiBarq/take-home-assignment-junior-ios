//
//  ProductTableViewCellRepresentable.swift
//  EasyShopper
//
//  Created by Harri on 6/26/20.
//  Copyright © 2020 Ka-ching. All rights reserved.
//


import Foundation
import UIKit

/// ProductTableViewCellRepresentable
class ProductTableViewCellRepresentable: TableViewCellRepresentable {
    
    /// Cell Height
    var cellHeight: CGFloat
    
    /// Cell Representable
    var cellReuseIdentifier: String
    
    /// Name
    let name: String
    
    /// Image URL
    let imageURL: String
        
    /**
     Init
     */
    init() {
        
        // Set default values
        self.cellHeight = 0.0
        self.cellReuseIdentifier = ""
        self.name = ""
        self.imageURL = ""
    }
    
    init(name: String, imageURL: String) {
        
        // Setup cell height
        self.cellHeight = ProductTableViewCell.getCellHeight()
        
        // Setup cell reuse identifier
        self.cellReuseIdentifier = ProductTableViewCell.getReuseIdentifier()
        
        // Set name
        self.name = name
        
        // Set image url
        self.imageURL = imageURL
    }
}
