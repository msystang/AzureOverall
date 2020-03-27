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
    
    // TODO: Detetmine where to put Settings, change to menu?
    //    lazy var settingsButton: UIBarButtonItem = {
    //        let button = UIBarButtonItem(image: UIImage(systemName: SystemImages.gear.rawValue), style: .plain, target: self, action: #selector(settingsButtonPressed))
    //        return button
    //    }()
    
    // MARK: - Internal Properties
    var searchString: String? = nil {
        didSet {
            loadRecipes()
        }
    }
    
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
    }
    
    // MARK: - Objc Methods
//    @objc func settingsButtonPressed() {
//
//    }

    // MARK: - Internal Methods
    private func loadRecipes() {
        // TODO: Update searchCount
        let urlStr = RecipeNetworkHelper.getUrlStr(from: searchString ?? "", searchCount: 7)
        
        // Dispatches data task asynchronously on the main thread
        DispatchQueue.main.async {
            RecipeNetworkHelper.manager.getRecipes(from: urlStr) { (result) in
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

