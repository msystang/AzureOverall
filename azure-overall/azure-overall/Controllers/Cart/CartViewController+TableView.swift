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
        
        cell.recipeImageView.kf.indicatorType = .activity
        
        if let imageUrl = recipe.imageUrl {
            let imgUrl = URL(string: imageUrl)
            cell.recipeImageView.kf.setImage(with: imgUrl, placeholder: UIImage(named: AppImages.noPhoto.rawValue))
            
        } else {
            cell.recipeImageView.image = UIImage(named: AppImages.noPhoto.rawValue)
        }
        
        cell.recipeTitleLabel.text = recipe.title
        cell.quantityLabel.text = "Quantity: \(recipe.quantity ?? 0)"
        
        
        return cell
    }
    
    
}

// MARK: - TableView Delegate Methods
extension CartViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return AODesign.tableViewHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = recipes[indexPath.row]
        
        let detailVC = DetailViewController()
        detailVC.recipe = recipe
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
