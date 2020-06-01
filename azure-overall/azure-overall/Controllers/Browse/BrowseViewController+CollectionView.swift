//
//  BrowseViewController+CollectionView.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit
import Kingfisher

// MARK: - CollectionView Data Source Methods
extension BrowseViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.recipeCollectionViewCell.rawValue, for: indexPath) as! RecipeCollectionViewCell
        
        let recipe = recipes[indexPath.row]
        
        
        cell.recipeImageView.kf.indicatorType = .activity
        
        if let imageUrl = recipe.imageUrl {
            let imgUrl = URL(string: imageUrl)
            cell.recipeImageView.kf.setImage(with: imgUrl, placeholder: UIImage(named: AppImages.noPhoto.rawValue))
            
        } else {
            cell.recipeImageView.image = UIImage(named: AppImages.noPhoto.rawValue)
        }
        
        cell.recipeTitleLabel.text = recipe.title
        cell.recipeInfoLabel.text = "\(recipe.servings) servings, \(recipe.readyInMinutes) minutes"
        
        return cell
    }
    
}

// MARK: - CollectionView Delegate Methods
extension BrowseViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        // Adds padding to top, left, and right of the collectionView
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        // Horizontal spacing
        layout.minimumInteritemSpacing = 10
        // Vertical spacing
        layout.minimumLineSpacing = 30
        layout.invalidateLayout()
        
        return CGSize(width: ((self.view.frame.width / 2) - 15), height:((self.view.frame.width / 2) - 15));
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: Guard that there is a recipe, else showAlert
        let recipe = recipes[indexPath.row]
        
        let detailVC = DetailViewController()
        detailVC.recipe = recipe
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
