//
//  CartViewController+TableView.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

// MARK: - TableView Data Source Methods
extension CartViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.recipeTableViewCell.rawValue, for: indexPath) as! RecipeTableViewCell
        let recipe = recipes[indexPath.row]
        let imgUrl = URL(string: recipe.imageUrl)
        
        cell.recipeTitleLabel.text = recipe.title
        //TODO: deal with force unwrap
        cell.quantityLabel.text = "Quantity: \(recipe.quantity!)"
        cell.recipeImageView.kf.indicatorType = .activity
        cell.recipeImageView.kf.setImage(with: imgUrl, placeholder: UIImage(named: AppImages.noPhoto.rawValue))
        
        return cell
    }
    
    
}

// MARK: - TableView Delegate Methods
extension CartViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = recipes[indexPath.row]
        
        let detailVC = DetailViewController()
        detailVC.recipe = recipe
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
