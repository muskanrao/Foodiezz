//
//  CategoryCollectionViewCell.swift
//  Foodiezz
//
//  Created by Muskan on 28/06/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    func setup(category: DishCategory){
        
        categoryTitle.text = category.name
        categoryImage.image = .init(named: category.image)
        
    }
    
    
}
