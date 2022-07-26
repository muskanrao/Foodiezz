//
//  DishlandscapeCollectionViewCell.swift
//  Foodiezz
//
//  Created by Muskan on 29/06/22.
//

import UIKit

class DishlandscapeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: DishlandscapeCollectionViewCell.self)
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var dishImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(dishes: Dish){
        
        dishImage.image = .init(named: dishes.image)
        titleLabel.text = dishes.id
        descriptionLabel.text = dishes.description
        caloriesLabel.text = dishes.formattedCalories
        
    }

}
