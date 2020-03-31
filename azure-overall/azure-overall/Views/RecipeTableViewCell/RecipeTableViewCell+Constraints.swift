//
//  RecipeTableViewCell+Constraints.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

extension RecipeTableViewCell {
    
    // MARK: - Public Constraint Methods
    func addSubviews() {
        self.addSubview(recipeImageView)
        self.addSubview(recipeTitleLabel)
        self.addSubview(quantityLabel)
    }
    
    func addConstraints() {
        setRecipeImageViewConstraints()
        setRecipeTitleLabelConstraints()
        setQuantityLabelConstraints()
    }
    
    // MARK: - Private Constraint Methods
    private func setRecipeImageViewConstraints() {
        recipeImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            recipeImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            recipeImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            recipeImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            recipeImageView.widthAnchor.constraint(equalTo: recipeImageView.heightAnchor)
        ])
    }
    
    private func setRecipeTitleLabelConstraints() {
        recipeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            recipeTitleLabel.leftAnchor.constraint(equalTo: recipeImageView.rightAnchor, constant: 15),
            recipeTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            recipeTitleLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -5)
        ])
    }
    
    private func setQuantityLabelConstraints() {
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            quantityLabel.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 5),
            quantityLabel.leadingAnchor.constraint(equalTo: recipeTitleLabel.leadingAnchor),
            quantityLabel.rightAnchor.constraint(equalTo: recipeTitleLabel.rightAnchor)
        ])
    }
    
}
