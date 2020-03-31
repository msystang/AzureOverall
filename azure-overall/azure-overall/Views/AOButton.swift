//
//  AOButton.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/31/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class AOButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = AODesign.black
        self.titleLabel?.font = UIFont(name: AODesign.fontName.bold.rawValue, size: AODesign.fontSize.med.rawValue)
        self.showsTouchWhenHighlighted = true
        self.layer.cornerRadius = 5
        self.layer.borderColor = AODesign.azure.cgColor
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
