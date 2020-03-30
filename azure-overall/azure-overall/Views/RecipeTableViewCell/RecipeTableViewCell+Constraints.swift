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
            recipeImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            recipeImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            recipeImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            recipeImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4)
        ])
    }
    
    private func setRecipeTitleLabelConstraints() {
        recipeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            recipeTitleLabel.topAnchor.constraint(equalTo: recipeImageView.topAnchor),
            recipeTitleLabel.leftAnchor.constraint(equalTo: recipeImageView.rightAnchor, constant: 5),
            recipeTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 10),
            recipeTitleLabel.heightAnchor.constraint(equalTo: recipeImageView.heightAnchor, multiplier: 0.6)
        ])
    }
    
    private func setQuantityLabelConstraints() {
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            quantityLabel.topAnchor.constraint(equalTo: recipeTitleLabel.bottomAnchor),
            quantityLabel.leadingAnchor.constraint(equalTo: recipeTitleLabel.leadingAnchor),
            quantityLabel.rightAnchor.constraint(equalTo: recipeTitleLabel.rightAnchor),
            quantityLabel.bottomAnchor.constraint(equalTo: recipeImageView.bottomAnchor)
        ])
    }
    
}
