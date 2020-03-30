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
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.delegate = self
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.delegate = self
        return textField
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.showsTouchWhenHighlighted = true
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Me Up!", for: .normal)
        button.showsTouchWhenHighlighted = true
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [signUpButton, logInButton])
        stackView.alignment = .top
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView 
    }()
    
    // MARK: - Private Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addSubviews()
        addConstraints()
    }
    
    // MARK: - Objective-C Functions
    @objc func logInButtonPressed() {
        disableButtons()
        
    }
    
    @objc func signUpButtonPressed() {
        disableButtons()
        
    }
    
    // MARK: - Private Methods
    private func disableButtons() {
        signUpButton.isEnabled = false
        logInButton.isEnabled = false
    }
    
}
