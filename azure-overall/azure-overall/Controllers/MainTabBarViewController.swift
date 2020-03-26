//
//  TabBarViewController.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    let browseVC: UINavigationController = {
        let browseNavVC = UINavigationController(rootViewController: BrowseViewController())
        return browseNavVC
    }()
    
    let cartVC: UINavigationController = {
       let cartNavVC = UINavigationController(rootViewController: CartViewController())
        return cartNavVC
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        browseVC.tabBarItem = UITabBarItem(title: "Browse", image: UIImage(systemName: "magnifying-glass"), tag: 0)
        cartVC.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName:"car"), tag: 0)
        
        self.viewControllers = [browseVC, cartVC]
    }
    
}
