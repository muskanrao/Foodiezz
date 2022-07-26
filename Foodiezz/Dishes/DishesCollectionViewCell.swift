//
//  DishesCollectionViewCell.swift
//  Foodiezz
//
//  Created by Muskan on 28/06/22.
//

import UIKit

class DishesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let identifier = String(describing: DishesCollectionViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(dish : Dish){
        titleLabel.text = dish.name
        dishImage.image = .init(named: dish.image)
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
    }
    
}
