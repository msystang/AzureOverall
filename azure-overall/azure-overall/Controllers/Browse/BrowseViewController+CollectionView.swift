//
//  BrowseViewController+CollectionView.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

extension BrowseViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.recipeCollectionViewCell.rawValue, for: indexPath) as! RecipeCollectionViewCell
        
        let recipe = recipes[indexPath.row]
        
        cell.recipeTitleLabel.text = recipe.title
        
        return cell
    }
    
}

extension BrowseViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        // Adds padding to top, left, and right of the collectionView
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
            layout.invalidateLayout()

            return CGSize(width: ((self.view.frame.width / 2) - 15), height:((self.view.frame.width / 2) - 15));
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let recipe = collectionView.cellForItem(at: indexPath)
        
        let detailVC = DetailViewController()
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
