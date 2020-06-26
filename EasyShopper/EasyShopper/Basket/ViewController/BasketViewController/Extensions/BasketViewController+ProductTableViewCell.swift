//
//  BasketViewController+ProductTableViewCell.swift
//  EasyShopper
//
//  Created by Harri on 6/26/20.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation

// MARK:- Product Table View Cell Image Ready Delegate
extension BasketViewController: ProductTableViewCellDelegate {

    /**
     Image ready
     - Parameter indexPath: `IndexPath`
     */
    func productTableViewCellDelegateImageReady(at indexPath: IndexPath) {
        
        // Reload table view rows
        self.tableView.reloadRows(at: [indexPath], with: .none)
    }
}
