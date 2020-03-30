//
//  ViewController+Alert.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/30/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title:"OK", style: .default) { alert in }
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
