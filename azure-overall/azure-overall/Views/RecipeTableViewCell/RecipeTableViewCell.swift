//
//  CartTableViewCell.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    var recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .purple
        return imageView
    }()
    
    var recipeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        return label
    }()
    
    var quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "Quantity"
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
