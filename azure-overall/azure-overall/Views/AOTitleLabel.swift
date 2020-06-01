//
//  AOLabel.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/31/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class AOTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.font = UIFont(name: AODesign.fontName.bold.rawValue, size: AODesign.fontSize.med.rawValue)
        self.textAlignment = .left
        self.numberOfLines = 0
        self.adjustsFontSizeToFitWidth = true
        self.textColor = AODesign.gray
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
