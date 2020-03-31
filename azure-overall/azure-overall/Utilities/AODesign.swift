//
//  AODesign.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/31/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

struct AODesign {
    // MARK: Colors
    static let azure = #colorLiteral(red: 0, green: 0.4980392157, blue: 1, alpha: 1)
    static let white = UIColor.white
    static let black = UIColor.black
    static let gray = UIColor.darkGray
    
    // MARK: Font
    enum fontSize: CGFloat {
        case small = 13
        case med = 16
        case large = 20
    }
    
    enum fontName: String {
        case light = "KohinoorBangla-Light"
        case regular = "KohinoorBangla-Regular"
        case bold = "KohinoorBangla-Semibold"
    }
    
    // MARK: Size
    static let tableViewHeight: CGFloat = 150

}
