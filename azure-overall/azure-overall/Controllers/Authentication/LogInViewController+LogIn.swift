//
//  LogInViewController+LogIn.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import Foundation
import FirebaseAuth

// MARK: - Log In Methods
extension LogInViewController {
    
    func attemptLogIn(email: String, password: String) {
        FirebaseAuthService.manager.logInUser(email: email, password: password) { (result) in
            self.handleLoginResponse(with: result)
        }
    }
    
    private func handleLoginResponse(with result: Result<(), Error>) {
        switch result {
        case .success:
            transitionToMainTabBarVC()
        case .failure(let error):
            okAlert(title: "Error", message: "Could not log in: \(error.localizedDescription)")
            enableButtons()
        }
    }
}
