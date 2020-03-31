//
//  AONavigationViewController.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/31/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class AONavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        styleNavBar()
    }
    
    private func styleNavBar() {
        navigationBar.tintColor = AODesign.black
        navigationBar.barTintColor = AODesign.azure
        let textAttributes = [
            NSAttributedString.Key.foregroundColor : AODesign.white,
            NSAttributedString.Key.font : UIFont(name: AODesign.fontName.bold.rawValue, size: AODesign.fontSize.large.rawValue)!] as [NSAttributedString.Key : Any]
        navigationBar.titleTextAttributes = textAttributes
    }
}
