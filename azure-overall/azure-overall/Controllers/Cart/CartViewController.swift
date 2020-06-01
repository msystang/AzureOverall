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
    
    var noRecipeLabel: AOSubtitleLabel = {
        let label = AOSubtitleLabel()
        label.text = "Currently no items in your cart :("
        label.textAlignment = .center
        label.textColor = AODesign.teal
        return label
    }()
    
    // MARK: - Internal Properties
    var recipes = [Recipe]() {
        didSet{
            toggleNoRecipeLabel()
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
            okAlert(title: "Oops!", message: "Could not load your cart at this time. Error: \(error)")
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
            okAlert(title: "Oops!", message: "Could not clear your cart at this time. Error: \(error)")
        }
        
        loadCart()
    }
    
    private func toggleNoRecipeLabel() {
        switch recipes.count == 0 {
        case true:
            noRecipeLabel.isHidden = false
        case false:
            noRecipeLabel.isHidden = true
        }
    }
}
