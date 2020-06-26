//
//  AddProductViewModel.swift
//  EasyShopper
//
//  Created by Harri on 6/26/20.
//  Copyright © 2020 Ka-ching. All rights reserved.
//


import Foundation
import UIKit

/// Add Product View Model
class AddProductViewModel {
    
    /// Representables
    private var representables: [TableViewCellRepresentable]
    
    /// Products
    private var products: [Product]
    
    /**
     Init
     */
    init() {
        
        // Set default values
        self.representables = []
        self.products = []
    }
    
    /**
     Build representables
     - Parameter products: Array of products
     */
    func buildRepresentables(products: [Product]) {
        for product in products {
            
            // Add product to representables
            self.representables.append(ProductTableViewCellRepresentable(name: product.name, imageURL: product.imageUrl))
        }
        
        // Setup products
        self.products = products
    }
    
    /**
     Get product at
     - Parameter index: `IndexPath`
     - Returns: `Product`
     */
    func getProductAt(index: IndexPath) -> Product? {
        return self.products[index.row]
    }
    
    // MARK:- Table View DataSource
    
    /**
     Get number of rows in sections.
     - Parameter section: Section number as Int.
     - Returns: Number of rows in section as Int.
     */
    func numberOfRows(inSection section: Int) -> Int {
        
        return self.representables.count
    }
    
    /**
     Get number of sections
     - Returns: Number of Sections as Int.
     */
    func numberOfSections() -> Int {
        
        return 1
    }
    
    /**
     Get height of row at indexPath.
     - Parameter indexPath: Index path.
     - Parameter tableView: Table View.
     - Returns: height of row at indexPath as CGFloat.
     */
    func heightForRow(at indexPath: IndexPath, tableView: UITableView) -> CGFloat {
        
        return self.representables[indexPath.row].cellHeight
    }
    
    /**
     Get cell representable at indexPath.
     - Parameter indexPath: Index path.
     - Returns: Cell representable as tableView cell representable.
     */
    func representableForRow(at indexPath: IndexPath) -> TableViewCellRepresentable? {
        
        return self.representables[indexPath.row]
    }
}
