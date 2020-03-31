//
//  ViewController.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class BrowseViewController: AOViewController {
    
    // MARK: - UI Objects
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        setUpSearchBar(searchBar: searchBar)
        return searchBar
    }()
    
    lazy var recipeCollectionView: UICollectionView = {
        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        setUpCollectionView(collectionView: collectionView)
        return collectionView
    }()
    
    var noRecipeLabel: AOSubtitleLabel = {
        let label = AOSubtitleLabel()
        label.text = "Search for a recipe in the search bar to get started!"
        label.textAlignment = .center
        label.textColor = AODesign.teal
        return label
    }()
    
    // MARK: - Internal Properties
    var searchString: String? = nil {
        didSet {
            loadRecipes()
        }
    }
    
    // TODO: Can use based on user preference
    var searchCount: Int = 20
    
    var recipes = [Recipe]() {
        didSet {
            toggleNoRecipeLabel()
            recipeCollectionView.reloadData()
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
        
    }
    
    // MARK: - Internal Methods
    private func setTitle() {
        self.navigationItem.title = NavBarTitle.browse.rawValue
    }
    
    private func loadRecipes() {
        // TODO: Update searchCount
        let urlStr = RecipeNetworkHelper.getUrlStr(from: searchString ?? "", searchCount: 7)
        
        RecipeNetworkHelper.manager.getRecipes(from: urlStr) { (result) in
            // Dispatches data task asynchronously on the main thread
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    // TODO: Handle error, create alerts
                    print(error)
                case .success(let recipes):
                    self.recipes = recipes
                }
            }
        }
    }
    
    private func setUpSearchBar(searchBar: UISearchBar) {
        searchBar.delegate = self
        
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = SearchBarTitle.placeholder.rawValue
        
        searchBar.searchTextField.font = UIFont(name: AODesign.fontName.light.rawValue, size: AODesign.fontSize.med.rawValue)
        searchBar.searchTextField.textColor = AODesign.black
        searchBar.tintColor = AODesign.teal
    }
    
    private func setUpCollectionView(collectionView: UICollectionView) {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifiers.recipeCollectionViewCell.rawValue)
        
        collectionView.backgroundColor = .clear
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

