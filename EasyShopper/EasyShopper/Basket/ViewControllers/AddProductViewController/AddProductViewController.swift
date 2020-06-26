//
//  AddProductViewController.swift
//  EasyShopper
//
//  Created by Harri on 6/26/20.
//  Copyright © 2020 Ka-ching. All rights reserved.
//


import Foundation
import UIKit

// AddProductViewController
class AddProductViewController: UIViewController {
    
    /// Table View
    @IBOutlet weak var tableView: UITableView!
    
    // View Model
    var viewModel: AddProductViewModel!
    
    // Delegate
    weak var delegate: AddProductViewControllerDelegate?
    
    /**
     View did load
     **/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup view model
        self.viewModel = AddProductViewModel()
        
        // Setup table view
        self.setupTableView()
        
        // Setup navigation item
        self.setupNavigationItem()
        
        // Get data
        self.getData()
    }
    
    /**
     Setup navigation item
     */
    private func setupNavigationItem() {
        
        // Set navigation item title
        self.navigationItem.title = "Add Product"
    }
    
    /**
     Setup table view
     **/
    private func setupTableView() {
        
        // Setup table view delegate and data source
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Register product table view cell
        ProductTableViewCell.registerCell(in: self.tableView)
    }
    
    /**
     Get data
     **/
    private func getData() {
        
        // Get products
        NetworkingManager.getProducts { response in
            
            switch response {
                
            case .success(let products):
                
                // Build representables
                self.viewModel.buildRepresentables(products: products)
                
                DispatchQueue.main.async {
                    
                    // Reload table view data
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                
                // Show error message
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Eror",
                                                  message: error.localizedDescription,
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default))
                    self.present(alert, animated: true)
                }
            }
        }
    }
}

/// Add Product View Controller Delegate
protocol AddProductViewControllerDelegate: NSObjectProtocol {
    
    /**
     Did add product
     **/
    func addProductViewController(didAdd product: Product)
    
}
