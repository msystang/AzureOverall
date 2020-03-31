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
        
        setTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadCart()
    }
    
    // MARK: - Private Methods
    private func setTitle() {
        self.navigationItem.title = NavBarTitle.cart.rawValue
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
}
