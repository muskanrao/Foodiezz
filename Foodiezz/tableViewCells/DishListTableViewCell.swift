//
//  DishListTableViewCell.swift
//  Foodiezz
//
//  Created by Muskan on 30/06/22.
//

import UIKit


class DishListTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: DishListTableViewCell.self)
    internal var stepperValue : Int = 0
    
    

    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    
  
    func setup(dish : Dish){
        numberLabel.text = "1"
        dishImage.image = .init(named: dish.image)
        caloriesLabel.text = String("\(dish.calories)Cal")
        titleLabel.text = dish.name
        print(titleLabel.text)
        DescriptionLabel.text = "$\(dish.price)"
        //DescriptionLabel.text = dish.description
    }
    
   // func setup(oder: Order) {
    func setup(order: cartDsihes){
        numberLabel.text = "1"
        caloriesLabel.text = String("\(order.calories)Cal")
        dishImage.image = order.dishimage//.init(named: order.dishimage) //oder.dish!.image)
        titleLabel.text  = order.name
        DescriptionLabel.text = "$\(order.price)" //"$\(oder.dish?.price ?? 0)"
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        
       
        stepperValue += Int(sender.value)
        numberLabel.text = String(Int(sender.value))
        print(stepperValue)
        
        
    }
}

