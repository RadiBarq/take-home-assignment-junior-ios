//
//  BasketViewModel.swift
//  EasyShopper
//
//  Created by Harri on 6/26/20.
//  Copyright © 2020 Ka-ching. All rights reserved.
//


import Foundation
import UIKit

/// Basket VIew Model
class BasketViewModel {
    
    /// Representables
    private var representables: [TableViewCellRepresentable]
    
    /// Total Price
    private(set) var totalPrice: Int
    
    /**
     Init
     */
    init() {
        
        // Set default values
        self.representables = []
        self.totalPrice = 0
    }

    
    /**
     Add representable
     - Parameter product: `Product`
     **/
    func addRepresentable(product: Product) {
        
        // Add product to representables
        self.representables.append(ProductTableViewCellRepresentable(name: product.name, imageURL: product.imageUrl))
        
        // Add retail price to total price
        self.totalPrice += product.retailPrice
    }
    
    /**
     Clear representables
     **/
    func clearRepresentables() {
        
        // Clear all representables
        self.representables.removeAll()
        
        // Set total price to zero
        self.totalPrice = 0
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
