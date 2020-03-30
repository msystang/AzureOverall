//
//  RecipeCollectionViewCell.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Objects
    var recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .cyan
        return imageView
    }()
    
    var recipeTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Title"
        return label
    }()
    
    var recipeInfoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Info"
        return label
    }()
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
