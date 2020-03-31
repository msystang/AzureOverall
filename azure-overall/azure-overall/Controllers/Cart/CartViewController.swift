//
//  CartViewController.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class CartViewController: AOViewController {

    // MARK: - UI Objects
    lazy var recipeTableView: UITableView = {
        let tableView = UITableView()
        setUpTableView(tableView: tableView)
        return tableView
    }()
    
    lazy var clearCartButton: UIBarButtonItem = {
        let clearCartImage: UIImage? = UIImage(systemName: SystemImages.clearCart.rawValue)
        let barButton = UIBarButtonItem(image: clearCartImage, style: .plain, target: self, action: #selector(clearCartButtonPressed))
        return barButton
    }()
    
    // MARK: - Internal Properties
    var recipes = [Recipe]() {
        didSet{
            recipeTableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        addConstraints()
        
        setUpNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadCart()
    }
    
    // MARK: - Objc Methods
    @objc private func clearCartButtonPressed() {
        actionAlert(title: "Are you sure?", message: "You will lose all items in your cart.", actionTitle: "Clear") { (action) in
            self.clearCart()
        }
    }
    
    // MARK: - Private Methods
    private func setUpNavBar() {
        self.navigationItem.title = NavBarTitle.cart.rawValue
        navigationItem.rightBarButtonItem = clearCartButton
    }
    
    private func loadCart() {
        do {
            recipes = try RecipePersistenceHelper.manager.getRecipes()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func setUpTableView(tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(RecipeTableViewCell.self, forCellReuseIdentifier: CellIdentifiers.recipeTableViewCell.rawValue)
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
    }
    
    private func clearCart() {
        do {
            try RecipePersistenceHelper.manager.clearCart()
        } catch {
            print(error)
        }
        
        loadCart()
    }
}
