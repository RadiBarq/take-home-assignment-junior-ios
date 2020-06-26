//
//  AddProductViewController+TableViewDataSource.swift
//  EasyShopper
//
//  Created by Harri on 6/26/20.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import UIKit


// MARK: - UITableView Delegate And DataSource
extension AddProductViewController: UITableViewDataSource, UITableViewDelegate {
    
    /**
     Number of sections
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections()
    }
    
    /**
     Number of rows in section
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows(inSection: section)
    }
    
    /**
     Height for row at indexPath
     */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.viewModel.heightForRow(at: indexPath, tableView: tableView)
    }
    
    /**
     Cell for row at indexPath
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Product Table View Cell
        if let cellRepresentable = self.viewModel.representableForRow(at: indexPath) as? ProductTableViewCellRepresentable, let cell = tableView.dequeueReusableCell(withIdentifier: cellRepresentable.cellReuseIdentifier, for: indexPath) as? ProductTableViewCell {
            
            // Setup cell
            cell.setup(with: cellRepresentable, indexPath: indexPath)
            
            // Set delegate
            cell.delegate = self
            
            // Return cell
            return cell
        }
        
        return UITableViewCell()
    }
    
    /**
     Did select row at index path
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Get product at index path
        guard let product = self.viewModel.getProductAt(index: indexPath) else {
            return
        }
        
        // Dismiss view controller
        self.dismiss(animated: true) {
        
            // Call did add product delegate
            self.delegate?.addProductViewController(didAdd: product)
        }
    }
}
