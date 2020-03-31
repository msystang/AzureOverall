//
//  DetailViewController.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class DetailViewController: AOViewController {
    // MARK: - UI Objects
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        setUpTitleLabel(label: label)
        return label
    }()
    
    var recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var quantityTitleLabel: AOTitleLabel = {
        let label = AOTitleLabel()
        label.text = LabelTitles.quantity.rawValue
        return label
    }()
    
    lazy var quantityLabel: AOSubtitleLabel = {
        let label = AOSubtitleLabel()
        label.font = UIFont(name: AODesign.fontName.bold.rawValue, size: AODesign.fontSize.large.rawValue)
        return label
    }()
    
    lazy var quantityStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 9
        stepper.value = 0
        stepper.stepValue = 1
        stepper.addTarget(self, action: #selector(stepperValueChanged(sender:)), for: .valueChanged)
        return stepper
    }()
    
    lazy var quantityStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [quantityLabel, quantityStepper])
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var updateCartButton: AOButton = {
        let button = AOButton()
        button.setTitle(ButtonTitle.updateCart.rawValue, for: .normal)
        button.addTarget(self, action: #selector(updateCartButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Internal Properties
    var recipe: Recipe!
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        addConstraints()
        
        setUpNavBar()
        loadImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadQuantity()
    }
    
    // MARK: - Objc Functions
    @objc private func stepperValueChanged(sender: UIStepper) {
        quantityLabel.text = Int(quantityStepper.value).description
    }
    
    @objc private func updateCartButtonPressed() {
        let recipeID = recipe.id
        recipe.quantity = Int(quantityStepper.value)
        
        switch isRecipeInCart(for: recipeID) {
        case false:
            do {
                try RecipePersistenceHelper.manager.saveRecipe(recipe: recipe)
            } catch {
                print(error.localizedDescription)
            }
            
        case true:
            do {
                try RecipePersistenceHelper.manager.editRecipe(with: recipeID, with: recipe)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Private Methods
    private func setUpNavBar() {
        navigationItem.titleView = titleLabel
    }
    
    private func setUpTitleLabel(label: UILabel) {
        label.numberOfLines = 0
        label.text = recipe.title
        label.textColor = AODesign.white
        label.textAlignment = .center
        label.font = UIFont(name: AODesign.fontName.bold.rawValue, size: AODesign.fontSize.large.rawValue)
        label.adjustsFontSizeToFitWidth = true
    }
    
    private func loadImage() {
        if let imageUrl = recipe.imageUrl {
            let imgUrl = URL(string: imageUrl)
            recipeImageView.kf.setImage(with: imgUrl, placeholder: UIImage(named: AppImages.noPhoto.rawValue))
        } else {
            recipeImageView.image = UIImage(named: AppImages.noPhoto.rawValue)
        }
        
    }
    
    private func isRecipeInCart(for recipeID: Int) -> Bool {
        var isInCart = false
        
        do {
            isInCart = try RecipePersistenceHelper.manager.isInCart(recipeID: recipeID)
        } catch {
            print(error.localizedDescription)
        }
        
        return isInCart
    }
    
    private func loadQuantity() {
        let recipeID = recipe.id
        
        switch isRecipeInCart(for: recipeID) {
        case false:
            quantityLabel.text = "0"
        case true:
            do {
                recipe = try RecipePersistenceHelper.manager.getRecipe(with: recipeID)
            } catch {
                print(error.localizedDescription)
            }
            quantityLabel.text = "\(Int(recipe.quantity ?? 0))"
        }
        quantityStepper.value = Double(recipe.quantity ?? 0)
    }
}
