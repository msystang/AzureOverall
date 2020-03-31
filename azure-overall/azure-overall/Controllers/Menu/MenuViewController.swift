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
    lazy var emailTitleLabel: AOTitleLabel = {
        let label = AOTitleLabel()
        label.text = "Email"
        return label
    }()
    
    lazy var emailLabel: AOSubtitleLabel = {
        let label = AOSubtitleLabel()
        label.text = FirebaseAuthService.manager.currentUser?.email ?? "No email for this account"
        return label
    }()
    
    var checkOutButton: AOButton = {
        let button = AOButton()
        button.setTitle(ButtonTitle.checkOut.rawValue, for: .normal)
        return button
    }()
    
    lazy var logOutButton: UIBarButtonItem = {
        let logOutImage: UIImage? = UIImage(systemName: SystemImages.logOut.rawValue)
        let barButton = UIBarButtonItem(image: logOutImage, style: .plain, target: self, action: #selector(logOutButtonPressed))
        return barButton
    }()
    
    var updateLabel: AOSubtitleLabel = {
        let label = AOSubtitleLabel()
        label.text = """
                    More features to come, such as:
                    - Search based on user preferences, diets, restrictions, serving sizes, preparation time
                    - Ability to favorite recipes and add notes 
                    """
        return label
    }()

    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavBar()
        
        addSubviews()
        addConstraints()
    }
    
    // MARK: - Objc Methods
    @objc func logOutButtonPressed() {
        self.actionAlert(title: "Are you sure you want to log out?", message: "Items in your cart will be lost.", actionTitle: "Log Out") { (action) in
            self.attemptLogOut()
        }
    }
    
    // MARK: - Private Methods
    private func setUpNavBar() {
        self.navigationItem.title = NavBarTitle.menu.rawValue
        self.navigationItem.rightBarButtonItem = logOutButton
    }
    
}
