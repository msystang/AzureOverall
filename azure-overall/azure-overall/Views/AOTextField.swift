//
//  AOTextField.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/31/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class AOTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.borderStyle = .roundedRect
        self.font = UIFont(name: AODesign.fontName.light.rawValue, size: AODesign.fontSize.med.rawValue)
        self.textColor = AODesign.black
        self.tintColor = AODesign.teal
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
