//
//  ViewController.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController {
    
    // MARK: - UI Objects
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
        searchBar.placeholder = SearchBarTitle.placeholder.rawValue
        return searchBar
    }()
    
    lazy var recipeCollectionView: UICollectionView = {
        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifiers.recipeCollectionViewCell.rawValue)
        collectionView.backgroundColor = .orange
        return collectionView
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
            recipeCollectionView.reloadData()
        }
    }
    
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
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
}

