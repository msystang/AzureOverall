//
//  RecipeTableViewCell+Constraints.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

extension RecipeTableViewCell {
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
    
    private func setRecipeImageViewConstraints() {
        recipeImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            recipeImageView.topAnchor.constraint(equalTo: self.topAnchor),
            recipeImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            recipeImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            recipeImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4)
        ])
    }
    
    private func setRecipeTitleLabelConstraints() {
        recipeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            recipeTitleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            recipeTitleLabel.leftAnchor.constraint(equalTo: recipeImageView.rightAnchor, constant: 5),
            recipeTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            recipeTitleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6)
        ])
    }
    
    private func setQuantityLabelConstraints() {
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            quantityLabel.topAnchor.constraint(equalTo: recipeTitleLabel.bottomAnchor),
            quantityLabel.leadingAnchor.constraint(equalTo: recipeTitleLabel.leadingAnchor),
            quantityLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            quantityLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
