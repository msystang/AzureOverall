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
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Me Up!", for: .normal)
        button.showsTouchWhenHighlighted = true
        button.backgroundColor = .red
        button.tag = 0
        button.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.showsTouchWhenHighlighted = true
        button.backgroundColor = .red
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
        view.backgroundColor = .white
        
        addSubviews()
        addConstraints()
        
        disableButtons()
    }
    
    // MARK: - Objective-C Functions
    @objc func buttonPressed(sender: UIButton) {
        disableButtons()
        
        //Todo: Create validateTextFields func for both buttons
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            showAlert(title: "Error", message: "Please fill out all fields.")
            return
        }
        
        guard email.isValidEmail else {
            showAlert(title: "Error", message: "Please enter a valid email")
            return
        }
        
        guard password.isValidPassword else {
            showAlert(title: "Error", message: "Please enter a valid password. Passwords must have at least 8 characters.")
            return
        }
        
        switch sender.tag {
        case 0:
            attemptSignUp(email: email, password: password)
        case 1:
            attemptLogIn(email: email, password: password)
        default:
            showAlert(title: "Oops!", message: "This button shouldn't exist.")
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
    
    // MARK: - Private Methods
    private func attemptLogIn(email: String, password: String) {
        FirebaseAuthService.manager.loginUser(email: email, password: password) { (result) in
            self.handleLoginResponse(with: result)
        }
    }
    
    private func handleLoginResponse(with result: Result<(), Error>) {
        switch result {
        case .success:
            print("Signed in")

        case .failure(let error):
            showAlert(title: "Error", message: "Could not log in: \(error.localizedDescription)")
            enableButtons()
        }
    }
    
}
