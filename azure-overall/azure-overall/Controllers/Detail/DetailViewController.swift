//
//  DetailViewController.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - UI Objects
    var recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    lazy var quantityTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Quantity"
        return label
    }()
    
    lazy var quantityLabel: UILabel = {
        let label = UILabel()
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
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var updateCartButton: UIButton = {
        let button = UIButton()
        button.setTitle("Update Cart", for: .normal)
        button.showsTouchWhenHighlighted = true
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(updateCartButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Internal Properties
    var recipe: Recipe!
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        addSubviews()
        addConstraints()
        
        setTitle()
        
        loadQuantityLabel()
        loadImage()
    }
    
    // MARK: - Objc Functions
    @objc private func stepperValueChanged(sender: UIStepper) {
        quantityLabel.text = Int(quantityStepper.value).description
    }
    
    @objc private func updateCartButtonPressed() {
        
        
        print("Updated Cart!")
    }
    
    // MARK: - Private Methods
    private func setTitle() {
        //TODO: Text wrap if title is too long
        self.navigationItem.title = recipe.title
    }
    
    private func loadQuantityLabel() {
        quantityLabel.text = "0"
    }
    
    private func loadImage() {
        recipeImageView.kf.indicatorType = .activity
        recipeImageView.kf.setImage(with: URL(string: recipe.imageUrl), placeholder: UIImage(named: AppImages.noPhoto.rawValue))
    }

}
