//
//  CartViewController.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    // MARK: - UI Objects
    lazy var recipeTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .blue
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(RecipeTableViewCell.self, forCellReuseIdentifier: CellIdentifiers.recipeTableViewCell.rawValue)
        return tableView
    }()
    
    var recipes = [Recipe]()
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        addSubviews()
        addConstraints()
    }
    
}
