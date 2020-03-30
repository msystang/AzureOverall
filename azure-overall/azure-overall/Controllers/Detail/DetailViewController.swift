//
//  DetailViewController.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "Quantity"
        return label
    }()
    
    lazy var quantityStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 20
        return stepper
    }()
    
    lazy var quantityStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [quantityLabel, quantityStepper])
        stackView.alignment = .center
        stackView.axis = .horizontal
        return stackView
    }()
    
    var recipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        //TODO: Add title to NavBar
        print(recipe.title)
        
        addSubviews()
        addConstraints()
    }
    
}
