//
//  CartViewController+Constraints.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

extension CartViewController {
    func addSubviews() {
        view.addSubview(recipeTableView)
    }
    
    
    func addConstraints() {
        setRecipeTableViewConstraints()
    }
    
    private func setRecipeTableViewConstraints() {
        recipeTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            recipeTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            recipeTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            recipeTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            recipeTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
