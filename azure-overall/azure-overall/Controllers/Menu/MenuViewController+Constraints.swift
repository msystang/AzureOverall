//
//  MenuViewController+Constraints.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/31/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

extension MenuViewController {
    // MARK: - Public Constraint Methods
    func addSubviews() {
        view.addSubview(emailTitleLabel)
        view.addSubview(emailLabel)
        view.addSubview(updateLabel)
    }
    
    func addConstraints() {
        setEmailTitleLabelConstraints()
        setEmailLabelConstraints()
        setUpdateLabelConstraints()
    }
    
    // MARK: - Private Constraint Methods
    private func setEmailTitleLabelConstraints() {
        emailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            emailTitleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            emailTitleLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8)
        ])
    }
    
    private func setEmailLabelConstraints() {
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: emailTitleLabel.bottomAnchor, constant: 10),
            emailLabel.leftAnchor.constraint(equalTo: emailTitleLabel.leftAnchor),
        ])
    }
    
    private func setUpdateLabelConstraints() {
        updateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            updateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            updateLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            updateLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
    }
}
