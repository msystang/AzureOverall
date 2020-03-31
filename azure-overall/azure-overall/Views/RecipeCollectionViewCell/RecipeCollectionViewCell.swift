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
    lazy var recipeImageView: UIImageView = {
        let imageView = UIImageView()
        setUpImageView(imageView: imageView)
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
    
    // MARK: - Private Methods
    private func setUpImageView(imageView: UIImageView) {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
    }
}
