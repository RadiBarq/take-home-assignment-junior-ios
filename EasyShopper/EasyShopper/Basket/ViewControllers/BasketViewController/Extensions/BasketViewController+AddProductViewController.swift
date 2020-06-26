//
//  BasketViewController+AddProductViewController.swift
//  EasyShopper
//
//  Created by Harri on 6/26/20.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation


// MARK: - Add Product View Controller Delegate
extension BasketViewController: AddProductViewControllerDelegate {
    
    /**
     Did add product
     **/
    func addProductViewController(didAdd product: Product) {
        
        // Add product
        self.addProduct(product: product)
    }
}

