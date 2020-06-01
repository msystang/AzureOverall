//
//  BrowseVC+Constraints.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

extension BrowseViewController {

    // MARK: - Public Constraint Methods
    func addSubviews() {
        view.addSubview(searchBar)
        view.addSubview(recipeCollectionView)
        recipeCollectionView.addSubview(noRecipeLabel)
    }
    
    func addConstraints() {
        setSearchBarConstraints()
        setRecipeCollectionViewConstraints()
        setNoRecipeLabelConstraints()
    }
    
    // MARK: - Private Constraint Methods
    private func setSearchBarConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            searchBar.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setRecipeCollectionViewConstraints() {
        recipeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            recipeCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            recipeCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            recipeCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            recipeCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setNoRecipeLabelConstraints() {
        noRecipeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            noRecipeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noRecipeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            noRecipeLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
        ])
    }
    
}
