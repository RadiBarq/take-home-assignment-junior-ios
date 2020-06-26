//
//  ProductTableViewCell.swift
//  EasyShopper
//
//  Created by Harri on 6/26/20.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import UIKit
import SDWebImage

/// Prodcut Table View Cell
class ProductTableViewCell: UITableViewCell {
    
    // Index Path
    var indexPath: IndexPath!
    
    // Delegate
    weak var delegate: ProductTableViewCellDelegate?
    
    /**
    Prepare for reuse
    */
    override func prepareForReuse() {
        self.imageView?.image = nil
    }
    
    
    
    // MARK: - Setup
    /**
     Setup
     - Parameter representable: `ProductTableViewCellRepresentable`
     - Parameter indexpath: `IndexPath`
     */
    func setup(with representable: ProductTableViewCellRepresentable, indexPath: IndexPath) {
        
        // Setup index path
        self.indexPath = indexPath
        
        // URL
        guard let url = URL(string: representable.imageURL) else { return }
        
        // Set imageView image
        self.imageView?.sd_setImage(with: url, completed: { (image, error, cachedType, url) in
            
            // Check if image is not cached then inform parent view controller to reload the table view after the image is ready
            if cachedType == .none || cachedType == .disk {
                self.delegate?.productTableViewCellDelegateImageReady(at: self.indexPath)
            }
        })
        
        // Setup text label text
        self.textLabel?.text = representable.name
    }
    

    // MARK: - Class methods
    
    /**
     Get cell resuse identifier
     - Returns: Cell reuse identifier as string.
     */
    class func getReuseIdentifier() -> String {
        return "ProductTableViewCell"
    }
    
    /**
     Register cell class in the table
     - Parameter tableView : The table view to register the cell in it
     */
    class func registerCell(in tableView: UITableView) {
        
        // Register table view cell
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.getReuseIdentifier())
    }
    
    /**
     Get cell height
     - Returns: cell height as CGFloat
     */
    class func getCellHeight() -> CGFloat {
        return UITableView.automaticDimension
    }
}

/// Product Table View Cell Delegate
protocol ProductTableViewCellDelegate: NSObjectProtocol {
    
    /**
     Image ready
     - Parameter indexPath: `IndexPath`
     */
    func productTableViewCellDelegateImageReady(at indexPath: IndexPath)
    
}
