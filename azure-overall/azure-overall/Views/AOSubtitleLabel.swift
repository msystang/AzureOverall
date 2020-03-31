//
//  AOSubtitleLabel.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/31/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class AOSubtitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.font = UIFont(name: AODesign.fontName.regular.rawValue, size: AODesign.fontSize.small.rawValue)
        self.textAlignment = .left
        self.numberOfLines = 0
        self.adjustsFontSizeToFitWidth = true
        self.textColor = AODesign.azure
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
