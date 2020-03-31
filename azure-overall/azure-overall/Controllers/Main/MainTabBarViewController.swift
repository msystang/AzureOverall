//
//  TabBarViewController.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    // MARK: - UI Objects
    let browseVC: UINavigationController = {
        let browseNavVC = UINavigationController(rootViewController: BrowseViewController())
        return browseNavVC
    }()
    
    let cartVC: UINavigationController = {
       let cartNavVC = UINavigationController(rootViewController: CartViewController())
        return cartNavVC
    }()
    
    let settingsVC: UIViewController = {
        let settingsVC = SettingsViewController()
        return settingsVC
    }()
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTabBar()
    }
    
    private func setUpTabBar() {
        browseVC.tabBarItem = UITabBarItem(title: TabBarTitle.browse.rawValue, image: UIImage(systemName: SystemImages.magnifyingGlass.rawValue), tag: 0)
        cartVC.tabBarItem = UITabBarItem(title: TabBarTitle.cart.rawValue, image: UIImage(systemName:SystemImages.cart.rawValue), tag: 1)
        settingsVC.tabBarItem = UITabBarItem(title: TabBarTitle.settings.rawValue, image: UIImage(systemName:SystemImages.gear.rawValue), tag: 2)
        
        self.viewControllers = [browseVC, cartVC, settingsVC]
    }
}
