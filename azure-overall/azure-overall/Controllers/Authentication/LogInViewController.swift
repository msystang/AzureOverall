//
//  LogInViewController.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {
    
    // MARK: - UI Objects
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = AppTitle.azureOverall.rawValue
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: AODesign.fontName.bold.rawValue, size: AODesign.fontSize.large.rawValue)
        return label
    }()
    
    var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: AppImages.logo.rawValue)
        return imageView
    }()
    
    lazy var emailTextField: AOTextField = {
        let textField = AOTextField()
        textField.placeholder = TextFieldTitle.email.rawValue
        textField.delegate = self
        return textField
    }()
    
    lazy var passwordTextField: AOTextField = {
        let textField = AOTextField()
        textField.placeholder = TextFieldTitle.password.rawValue
        textField.isSecureTextEntry = true
        textField.delegate = self
        return textField
    }()
    
    lazy var signUpButton: AOButton = {
        let button = AOButton()
        button.setTitle(ButtonTitle.signUp.rawValue, for: .normal)
        button.tag = 0
        button.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var logInButton: AOButton = {
        let button = AOButton()
        button.setTitle(ButtonTitle.logIn.rawValue, for: .normal)
        button.tag = 1
        button.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
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
        view.backgroundColor = AODesign.azure
        
        addSubviews()
        addConstraints()
        
        disableButtons()
    }
    
    // MARK: - Objective-C Functions
    @objc func buttonPressed(sender: UIButton) {
        disableButtons()
        
        //Todo: Create validateTextFields func for both buttons
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            okAlert(title: "Error", message: "Please fill out all fields.")
            return
        }
        
        guard email.isValidEmail else {
            okAlert(title: "Error", message: "Please enter a valid email")
            return
        }
        
        guard password.isValidPassword else {
            okAlert(title: "Error", message: "Please enter a valid password. Passwords must have at least 8 characters.")
            return
        }
        
        switch sender.tag {
        case 0:
            attemptSignUp(email: email, password: password)
        case 1:
            attemptLogIn(email: email, password: password)
        default:
            okAlert(title: "Oops!", message: "This button shouldn't exist.")
        }
    }
    
    // MARK: - Internal Methods
    func disableButtons() {
        signUpButton.isEnabled = false
        logInButton.isEnabled = false
    }
    
    func enableButtons() {
        signUpButton.isEnabled = true
        logInButton.isEnabled = true
    }
    
    func transitionToMainTabBarVC() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window
            else {
                return
        }
        
        UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromRight, animations: {
            window.rootViewController = {
                let browseVC = MainTabBarViewController()
                browseVC.selectedIndex = 0
                return browseVC
            }()
        }, completion: nil)
    }
    
}
