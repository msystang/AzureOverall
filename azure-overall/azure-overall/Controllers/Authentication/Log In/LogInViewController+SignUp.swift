//
//  LogInViewController+SignUp.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

// MARK: - Sign Up Methods
extension LogInViewController {
    
    func attemptSignUp(email: String, password: String) {
        FirebaseAuthService.manager.signUpUser(email: email, password: password) { (result) in
            self.handleSignUpResponse(with: result)
        }
    }
    
    private func handleSignUpResponse(with result: Result<User,Error>) {
        switch result {
        case .failure(let error):
            showAlert(title: "Error", message: "Could not sign up: \(error.localizedDescription)")
        case .success(let newUser):
            let newAppUser = AppUser(from: newUser)
            
            FirestoreService.manager.createUser(user: newAppUser) { [weak self] (newResult) in
                self?.addNewUserToFirestore(result: newResult)
            }
        }
    }
    
    private func addNewUserToFirestore(result: Result<(), Error>) {
        switch result {
        case .success:
            transitionToMainTabBarVC()
        case .failure(let error):
            self.showAlert(title: "Error creating user", message: "An error occured while creating new account \(error)")
            enableButtons()
        }
    }
}
