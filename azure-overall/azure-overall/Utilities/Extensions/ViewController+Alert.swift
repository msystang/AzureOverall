//
//  ViewController+Alert.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

// MARK: - ViewController Extensions
extension UIViewController {
    
    // MARK: flashAlert
    func flashAert(title: String?, message: String?, completion: (() -> ())? ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alertController, animated: true, completion: nil)
        dismiss(animated: true, completion: completion)
    }
    
    // MARK: okAlert
    func okAlert(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title:"OK", style: .default) { alert in }
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: actionAlert
    func actionAlert(title:String?, message:String?, actionTitle:String?, actionCompletion: ((UIAlertAction) -> ())?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: actionTitle, style:.destructive, handler: actionCompletion)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(action)
        alertController.addAction(cancel)
        
        present(alertController,animated: true)
    }
}
