//
//  DetailViewController+Constraints.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

extension DetailViewController {
    // MARK: - Public Constraint Methods
    func addSubviews() {
        view.addSubview(recipeImageView)
        view.addSubview(quantityLabel)
        view.addSubview(quantityStepper)
        view.addSubview(quantityStackView)
    }
    
    func addConstraints() {
        setRecipeImageViewConstraints()
        setQuantityStackViewConstraints()
    }
    
    // MARK: - Private Constraint Methods
    private func setRecipeImageViewConstraints() {
        recipeImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            recipeImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            recipeImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            recipeImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            recipeImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ])
    }
    
    private func setQuantityStackViewConstraints() {
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        quantityStepper.translatesAutoresizingMaskIntoConstraints = false
        quantityStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            quantityStackView.topAnchor.constraint(equalTo: recipeImageView.bottomAnchor, constant: 50),
            quantityStackView.centerXAnchor.constraint(equalTo: recipeImageView.centerXAnchor),
            quantityStackView.widthAnchor.constraint(equalTo: recipeImageView.widthAnchor, multiplier: 0.8),
            quantityStackView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
}
