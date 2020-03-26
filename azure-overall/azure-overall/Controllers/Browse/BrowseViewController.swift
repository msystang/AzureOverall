//
//  ViewController.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController {

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
    
    var searchString: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        addSubviews()
        addConstraints()
    }


}

