//
//  HomeViewController.swift
//  Foodiezz
//
//  Created by Muskan on 28/06/22.
//

import UIKit
import FirebaseAuth
import Firebase


class HomeViewController: UIViewController
{

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var chefsSpecialView: UICollectionView!
    
    var db = Firestore.firestore()
    var order : [cartDsihes] = []
    var count : Double = 0
    
    var categories : [DishCategory] = [
        
        .init(id: "id1", name: "Offers Near You", image: "cat1") ,
        .init(id: "id2", name: "North Indian", image: "cat2"),
        .init(id: "id3", name: "Thali", image: "cat3"),
        .init(id: "id4", name: "Biryani", image: "cat4"),
        .init(id: "id5", name: "Top Rated", image: "cat5"),
        .init(id: "id6", name: "South Indian", image: "cat6")
    
    ]
    
    var populars: [Dish] = [
        
        .init(id: "Taco", name: "Taco", description: "This is the best dish you would love to taste and never forget about it.", image: "toca2", calories: 34.243, price: 2),
        .init(id: "Dhokla", name: "Dhokla", description: "This is the best dish you would love to taste and never forget about it.", image: "dhokla", calories: 32.43, price: 3),
        .init(id: "Vada Pav", name: "Vada Pav", description: "This is the best dish you would love to taste and never forget about it.", image: "pav", calories: 44.43, price: 3),
        .init(id: "Nachos", name: "Nachos", description: "This is the best dish you would love to taste and never forget about it.", image: "nachos", calories: 34.2, price: 4),
        .init(id: "Tofu", name: "Tofu", description: "This is the best dish you would love to taste and never forget about it.", image: "tofu", calories: 34.4543, price: 4)
        
        
    ]
    
    var specials: [Dish] = [
        
        .init(id: "cheesy", name: "Special1", description: "This is the bestested dish ever discovered.", image: "cheesy", calories: 34.54, price: 2),
        .init(id: "brownie", name: "Special2", description: "This is the bestested dish ever discovered.", image: "brownie", calories: 43.45, price: 3),
        .init(id: "carrot", name: "Special3", description: "This is the bestested dish ever discovered.", image: "carrot", calories: 32.54, price: 4),
        .init(id: "Pad Krapow Gai", name: "Special4", description: "This is the bestested dish ever discovered.", image: "Pad Krapow Gai", calories: 21.54, price: 2),
        .init(id: "goodGreen", name: "Special5", description: "This is the bestested dish ever discovered.", image: "goodGreen", calories: 25.54, price: 2)
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        
    }
    @IBAction func logoutPressed(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        navigationController?.popToRootViewController(animated: true)
      
    }
    
    @IBAction func cartViewPressed(_ sender: UIButton) {
        
        loadBooking()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //super.prepare(for: segue, sender: self)
            if segue.identifier == "cartView" {
                let destinationVC = segue.destination as! CartViewController
                destinationVC.orders = order
                destinationVC.count = count
            }
       
    }
    
    
    
    func loadBooking(){
        db.collection("user").getDocuments { [self] (querySnapshot , error) in
            if error != nil{
                print("Error while loading saved data.")
            }else{
                if let snapshotDocuments = querySnapshot?.documents{
                    for doc in snapshotDocuments{
                        let data = doc.data()
                        print(Auth.auth().currentUser?.email)
                        if data["sender"] as! String  == Auth.auth().currentUser?.email {
                            let dishname = data["selectedDish"] as! String
                            let dishCalories = data["selectedCalories"] as! String
                            let dishImageUrl = data["selectedImage"] as! String
                            let dishPrice = data["price"] as! String
                            order.append(cartDsihes(name: dishname, calories: dishCalories, dishimage: .init(named: dishImageUrl)!, price: dishPrice))
                            let  totalItem = (data["price"] as! NSString).doubleValue
                            count += totalItem
                            print("total amount = \(count)")
                            print(dishname)
                            print(dishImageUrl)
                           
                        }
                        
                    }
                    performSegue(withIdentifier: "cartView", sender: self)
                }
            }
        }
    }
  
    
    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: DishesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishesCollectionViewCell.identifier)
        chefsSpecialView.register(UINib(nibName: DishlandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishlandscapeCollectionViewCell.identifier)
    }
    

}

extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView{
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case chefsSpecialView:
            return specials.count
        default: return 0
            
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView{
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            
            cell.setup(category: categories[indexPath.row])
            
            cell.layer.cornerRadius = 10.0
                    cell.layer.borderWidth = 0.0
                    cell.layer.shadowColor = UIColor.black.cgColor
                    cell.layer.shadowOffset = CGSize(width: 0, height: 0)
                    cell.layer.shadowRadius = 5.0
                    cell.layer.shadowOpacity = 1
                    cell.layer.masksToBounds = false
            
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishesCollectionViewCell.identifier, for: indexPath) as! DishesCollectionViewCell
            
            cell.setup(dish: populars[indexPath.row])
            
            cell.layer.cornerRadius = 10.0
                    cell.layer.borderWidth = 0.0
                    cell.layer.shadowColor = UIColor.black.cgColor
                    cell.layer.shadowOffset = CGSize(width: 0, height: 0)
                    cell.layer.shadowRadius = 5.0
                    cell.layer.shadowOpacity = 1
                    cell.layer.masksToBounds = false
            
            return cell
        case chefsSpecialView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishlandscapeCollectionViewCell.identifier, for: indexPath) as! DishlandscapeCollectionViewCell
            
            cell.setup(dishes: specials[indexPath.row])
            
            cell.layer.cornerRadius = 10.0
                    cell.layer.borderWidth = 0.0
                    cell.layer.shadowColor = UIColor.black.cgColor
                    cell.layer.shadowOffset = CGSize(width: 0, height: 0)
                    cell.layer.shadowRadius = 5.0
                    cell.layer.shadowOpacity = 1
                    cell.layer.masksToBounds = false
            
            return cell

        default: return UICollectionViewCell()
            
        }
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == categoryCollectionView {
            //performSegue(withIdentifier: "category", sender: self)
            
            let controller = storyboard?.instantiateViewController(withIdentifier: "dish") as? DishListViewController
            controller?.category = categories[indexPath.row]
            navigationController?.present(controller!, animated: true, completion: nil)
            
          
        }else{
        
            let controller  = storyboard?.instantiateViewController(withIdentifier: "dishes") as? DishDetailViewController
            
            controller!.dish  = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            
           // controller?.modalPresentationStyle = .fullScreen
            navigationController?.present(controller!, animated: true, completion: nil)
            
            
        }
        
    }
    
    

    
    
    
    
}
