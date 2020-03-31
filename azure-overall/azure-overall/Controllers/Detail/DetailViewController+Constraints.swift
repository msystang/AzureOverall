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
        view.addSubview(quantityTitleLabel)
        view.addSubview(quantityLabel)
        view.addSubview(quantityStepper)
        view.addSubview(quantityStackView)
        view.addSubview(updateCartButton)
    }
    
    func addConstraints() {
        setRecipeImageViewConstraints()
        setQuantityTitleLabelConstraints()
        setQuantityStackViewConstraints()
        setUpdateCartButtonConstraints()
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
    
    private func setQuantityTitleLabelConstraints() {
        quantityTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            quantityTitleLabel.topAnchor.constraint(equalTo: recipeImageView.bottomAnchor, constant: 50),
            quantityTitleLabel.centerXAnchor.constraint(equalTo: recipeImageView.centerXAnchor),
            quantityTitleLabel.widthAnchor.constraint(equalTo: recipeImageView.widthAnchor, multiplier: 0.8),
            quantityTitleLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    private func setQuantityStackViewConstraints() {
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        quantityStepper.translatesAutoresizingMaskIntoConstraints = false
        quantityStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            quantityStackView.topAnchor.constraint(equalTo: quantityTitleLabel.bottomAnchor, constant: 10),
            quantityStackView.centerXAnchor.constraint(equalTo: recipeImageView.centerXAnchor),
            quantityStackView.widthAnchor.constraint(equalTo: recipeImageView.widthAnchor, multiplier: 0.8),
            quantityStackView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setUpdateCartButtonConstraints() {
        updateCartButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            updateCartButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            updateCartButton.widthAnchor.constraint(equalToConstant: 120),
            updateCartButton.heightAnchor.constraint(equalToConstant: 40),
            updateCartButton.topAnchor.constraint(equalTo: quantityStackView.bottomAnchor, constant: 40)
        ])
    }
    
}
