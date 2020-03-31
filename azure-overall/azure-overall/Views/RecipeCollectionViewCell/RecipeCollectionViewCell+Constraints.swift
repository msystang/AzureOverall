//
//  RecipeCollectionViewCell+Constraints.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

extension RecipeCollectionViewCell {
    
    // MARK: - Public Constraint Methods
    func addSubviews() {
        self.addSubview(recipeImageView)
        self.addSubview(recipeTitleLabel)
        self.addSubview(recipeInfoLabel)
    }
    
    func addConstraints() {
        setRecipeImageViewConstraints()
        setRecipeTitleLabelConsraints()
        setRecipeInfoLabelConstraints()
    }
    
    // MARK: - Private Constraint Methods
    private func setRecipeImageViewConstraints() {
        recipeImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            recipeImageView.topAnchor.constraint(equalTo: self.topAnchor),
            recipeImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            recipeImageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            recipeImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7)
        ])
    }
    
    private func setRecipeTitleLabelConsraints() {
        recipeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            recipeTitleLabel.topAnchor.constraint(equalTo: recipeImageView.bottomAnchor),
            recipeTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            recipeTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            recipeTitleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2)
        ])
        
    }
    
    private func setRecipeInfoLabelConstraints() {
        recipeInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            recipeInfoLabel.topAnchor.constraint(equalTo: recipeTitleLabel.bottomAnchor),
            recipeInfoLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            recipeInfoLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            recipeInfoLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
}
