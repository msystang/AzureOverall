//
//  MenuViewController+LogOut.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/31/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

// MARK: - Log Out Methods
extension MenuViewController {
    
    func attemptLogOut() {
        FirebaseAuthService.manager.signOutUser { (result) in
            switch result {
            case .failure(let error):
                self.okAlert(title: "Oops!", message: "Could not log out at this time. Error: \(error)")
            case .success():
                self.clearCart()
                self.transitionToLogInVC()
            }
        }
    }
    
    func transitionToLogInVC() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window
            else {
                return
        }
        
        UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromRight, animations: {
            window.rootViewController = LogInViewController()
        }, completion: nil)
    }
    
    private func clearCart() {
        do {
            try RecipePersistenceHelper.manager.clearCart()
        } catch {
            print(error)
        }
    }
    
}
