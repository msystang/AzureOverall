//
//  LogInViewController+Constraints.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

extension LogInViewController {
    
    // MARK: - Public Constraint Methods
    func addSubviews() {
        view.addSubview(logoImageView)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(textFieldStackView)
        view.addSubview(signUpButton)
        view.addSubview(logInButton)
        view.addSubview(buttonStackView)
    }
    
    func addConstraints() {
        setLogoImageViewConstraints()
        setTextFieldStackViewConstraints()
        setButtonStackViewConstraints()
    }
    
    // MARK: - Private Constraint Methods
    private func setLogoImageViewConstraints() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
        ])
    }
    
    private func setTextFieldStackViewConstraints() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
        ])
    }
    
    private func setButtonStackViewConstraints() {
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
        ])
    }
    
}
