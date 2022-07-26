//
//  CartViewController.swift
//  Foodiezz
//
//  Created by Muskan on 01/07/22.
//

import UIKit
import Firebase

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var productsLabel: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var count: Double = 0
    var totalProducts : Int = 0

    let cellSpacingHeight: CGFloat = 100
    internal var price: Int = 0
  
    var db = Firestore.firestore()
    
    /*var orders: [Order] = [
        
        .init(id: "id1", name: "Black Salt", dish:  .init(id: "Id1", name: "Type1", description: "This is the best dish you would love to taste and never forget about it.", image: "food1", calories: 34.243, price: 2)),
        .init(id: "id1", name: "Pink Salt", dish:  .init(id: "Id1", name: "Type1", description: "This is the best dish you would love to taste and never forget about it.", image: "food1", calories: 34.243, price: 4))
      
    ]*/
    
    var orders: [cartDsihes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //tableView.cornerRadius = 10
       // loadBooking()
       
        tableView.frame = tableView.frame.inset(by: UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40))
        tableView.rowHeight = 89
        productsLabel.text = "\(orders.count)"
        itemLabel.text = "$\(count)"
        
        
        
       /* for i in orders{
            price += i.dish?.price ?? 0
        }
        */
        
        totalLabel.text = "$\(Int(Int(count) * orders.count))"
        title = "Orders"
        registerCell()
        
    }
    
    private func registerCell(){
        
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
        
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(orders.count)
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
       
        cell.backgroundColor = UIColor.clear
        cell.cornerRadius = 10
        cell.layer.shadowOpacity = 1
        cell.layer.shadowRadius = 1
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.layer.masksToBounds = true
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          return cellSpacingHeight
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

    @IBAction func editPressed(_ sender: UIButton) {
        
        self.tableView.isEditing = !self.tableView.isEditing
        sender.titleLabel?.text = (self.tableView.isEditing) ? "Done" : "Edit"
     
    }
    
    @IBAction func orderPressed(_ sender: UIButton) {
    }
    
   
        
    
    
   
}

struct cartDsihes{
    let name: String
    let calories: String
    let dishimage: UIImage
    let price: String
    
}
