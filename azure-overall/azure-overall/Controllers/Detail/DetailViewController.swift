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
        label.text = "10 (place holder)"
        return label
    }()
    
    lazy var quantityStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 20
        stepper.value = 0
        stepper.stepValue = 1
        return stepper
    }()
    
    lazy var quantityStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [quantityLabel, quantityStepper])
        stackView.alignment = .center
        stackView.axis = .horizontal
        return stackView
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
    }
    
    // MARK: - Private Methods
    private func setTitle() {
        //TODO: Text wrap if title is too long
        self.navigationItem.title = recipe.title
    }
    
}
