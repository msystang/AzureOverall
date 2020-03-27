//
//  DetailViewController.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    var recipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        print(recipe.title)
    }
    
}
