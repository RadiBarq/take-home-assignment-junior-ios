//
//  BasketViewController+TableViewDataSource.swift
//  EasyShopper
//
//  Created by Harri on 6/26/20.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UITableView Delegate And DataSource
extension BasketViewController: UITableViewDataSource, UITableViewDelegate {

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
            
            // Setup delegate
            cell.delegate = self
            
            // Return cell
            return cell
        }
        
        return UITableViewCell()
    }
}

