//
//  DishDetailViewController.swift
//  Foodiezz
//
//  Created by Muskan on 30/06/22.
//

import UIKit
import Firebase

class DishDetailViewController: UIViewController {

    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    
    var dish : Dish!
    var db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateView()
        
   
    }
    
    
    private func populateView(){
        dishImage.image = .init(named: dish.image)
        titleLabel.text = dish.id
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
        priceLabel.text = ("$\(dish.price)")
    }
    
    @IBAction func placeOrderPressed(_ sender: UIButton) {
        
        let DishName = dish.id
        let DishCalories = String(dish.formattedCalories)
        let dishIamgeUrl = dish.image
        let dishPrice = String(dish.price)
        let storedData = Auth.auth().currentUser?.email
        db.collection("user").addDocument(data: ["sender": storedData,"selectedDish": DishName, "selectedCalories": DishCalories, "selectedImage": dishIamgeUrl, "price": dishPrice]) { (error) in
            if let e = error{
                print("There  is issue while saving data to firestore FOR POPULAR AND SPECIAL VIEW.\(e)")
            }else{
                print("Succesfully saved")
            }
        }
        
        
    }
    
    

}
