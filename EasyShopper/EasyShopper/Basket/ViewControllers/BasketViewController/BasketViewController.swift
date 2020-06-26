//
//  BasketViewController.swift
//  EasyShopper
//
//  Created by Harri on 6/26/20.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import UIKit

/// BasketViewController
class BasketViewController: UIViewController {
    
    /// Table View
    @IBOutlet weak var tableView: UITableView!
    
    /// Bottom View
    @IBOutlet private weak var bottomView: UIView!
    
    /// Total Price Title Label
    @IBOutlet private weak var totalPriceTitleLabel: UILabel!
    
    /// Total Price Value Label
    @IBOutlet private weak var totalPriceValueLabel: UILabel!
    
    /// Basket View Model
    var viewModel: BasketViewModel!
    
    /**
     View did load
     **/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup view model
        self.viewModel = BasketViewModel()
        
        // Setup navigation item
        self.setupNavigationItem()
        
        // Setup table view
        self.setupTableView()
        
        // Setup bottom view
        self.setupBottomView()
    }
    
    // MARK: - Setup
    
    /**
     Setup navigation item
     */
    private func setupNavigationItem() {
        
        // Set navigation item title
        self.navigationItem.title = "Basket"
        
        // Set navigation right bar button item
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(self.didClickDoneButton))
        
        // Setup navigation left bar button item
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(self.didClickClearButton))
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
     Setup bottom view
     **/
    private func setupBottomView() {
        
        // Setup bottom view background color
        self.bottomView.backgroundColor = UIColor.green
        
        // Setup total price title label text
        self.totalPriceTitleLabel.text = "Total Price"
        
        // Setup total price value label
        self.totalPriceValueLabel.text = "0"
    }
    
    /**
     Did click done button
     **/
    @objc private func didClickDoneButton() {
        
        // Main story board
        let mainStoryBoard = UIStoryboard.init(name: "Main", bundle: .main)
        
        // Instantiate view controller
        let addProductViewController =  mainStoryBoard.instantiateViewController(identifier: "AddProductViewController") as! AddProductViewController
        
        // Setup add product controller delegate
        addProductViewController.delegate = self
        
        // Setup navigation controller
        let navigationController = UINavigationController()
        navigationController.viewControllers = [addProductViewController]
        
        // Present add product view controller
        self.navigationController?.present(navigationController, animated: true, completion: nil)
    }
    
    /**
     Did click clear button
     */
    @objc private func didClickClearButton() {
        
        // Clear representables
        self.viewModel.clearRepresentables()
        
        // Reload table view data
        self.tableView.reloadData()
        
        // Setup total price value
        self.totalPriceValueLabel.text = String(describing: self.viewModel.totalPrice)
    }
    
    /**
     Add product
     **/
    func addProduct(product: Product) {
        
        // Add representable
        self.viewModel.addRepresentable(product: product)
        
        // Reload table view data
        self.tableView.reloadData()
        
        // Setup total price value
        self.totalPriceValueLabel.text = String(describing: self.viewModel.totalPrice)
    }
}
