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
    
    var recipeTitleLabel: AOTitleLabel = {
        let label = AOTitleLabel()
        label.textAlignment = .center
        return label
    }()
    
    var recipeInfoLabel: AOSubtitleLabel = {
        let label = AOSubtitleLabel()
        label.textAlignment = .center
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
