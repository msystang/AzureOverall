//
//  LogInViewController.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    // MARK: - UI Objects
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Azure Overall"
        label.textAlignment = .center
        return label
    }()
    
    var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: AppImages.logo.rawValue)
        return imageView
    }()
    
    var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Me Up!", for: .normal)
        button.showsTouchWhenHighlighted = true
        button.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [signUpButton, logInButton])
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        return stackView 
    }()
    
    // MARK: - Private Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - Objective-C Functions
    @objc func logInButtonPressed() {
        
    }
    
    @objc func signUpButtonPressed() {
        
    }
    
}
