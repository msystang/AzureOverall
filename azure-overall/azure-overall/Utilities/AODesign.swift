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
    static let teal = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    
    // MARK: Font
    enum fontSize: CGFloat {
        case small = 15
        case med = 17
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
