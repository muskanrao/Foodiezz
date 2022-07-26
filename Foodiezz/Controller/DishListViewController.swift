//
//  DishListViewController.swift
//  Foodiezz
//
//  Created by Muskan on 30/06/22.
//

import UIKit
import Firebase

class DishListViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    // @IBOutlet weak var tableView: UITableView!
  // @IBOutlet weak var collectionView: UICollectionView!
    
    var category: DishCategory!
    
    var dishes: [Dish] = [
        
        
        .init(id: "Id1", name: "Type1", description: "This is the best dish you would love to taste and never forget about it.", image: "food1", calories: 34.243, price: 2),
        .init(id: "Id2", name: "Type2", description: "This is the best dish you would love to taste and never forget about it.", image: "food1", calories: 32.43, price: 2),
        .init(id: "Id3", name: "Type3", description: "This is the best dish you would love to taste and never forget about it.", image: "food1", calories: 44.43, price: 3),
        .init(id: "Id4", name: "Type4", description: "This is the best dish you would love to taste and never forget about it.", image: "food1", calories: 34.2, price: 3),
        .init(id: "Id5", name: "Type5", description: "This is the best dish you would love to taste and never forget about it.", image: "food1", calories: 34.4543, price: 2)
    
    ]
    var DishName : String  = ""
    var DishCalories : String = ""
    var dishIamgeUrl : String = ""
    var dishPrice: String = ""
    var db = Firestore.firestore()


    override func viewDidLoad() {
        super.viewDidLoad()
       // collectionView.cornerRadius = 10
       // collectionView.frame = collectionView.frame.inset(by: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        tableView.rowHeight = 100
        title = category.name
        registerCell()
        
        
    }
    
    func registerCell(){
        
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
        
        
    }
    
   
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dishes.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        
     
        
        cell.backgroundColor = UIColor.clear
        cell.cornerRadius = 10
        cell.layer.shadowOpacity = 1
        cell.layer.shadowRadius = 1
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.layer.masksToBounds = true
        
        //cell.frame = cell.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
       
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        DishName = dishes[indexPath.row].name
        DishCalories = String(dishes[indexPath.row].price)
        dishIamgeUrl = dishes[indexPath.row].image
        dishPrice = String(dishes[indexPath.row].price)
    
            
        
        
        
    }

    @IBAction func placeOrderPressed(_ sender: UIButton) {
        
        let storedData = Auth.auth().currentUser?.email
        db.collection("user").addDocument(data: ["sender": storedData,"selectedDish": DishName, "selectedCalories": DishCalories, "selectedImage": dishIamgeUrl, "price": dishPrice]) { (error) in
            if let e = error{
                print("There  is an issue while saving data to firestore FOR CATEGORY VIEW. \(e)")
            }else{
                print("Succesfully saved")
            }
        }
        
    }
    
}
