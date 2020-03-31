//
//  ProfileViewController.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit
import FirebaseAuth

class MenuViewController: AOViewController {
    
    // MARK: - UI Objects
    var userInfoLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var logOutButton: UIButton = {
        let button = UIButton()
        button.setTitle(ButtonTitle.logOut.rawValue, for: .normal)
        return button
    }()
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
