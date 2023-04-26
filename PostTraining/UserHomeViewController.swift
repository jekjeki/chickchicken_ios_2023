//
//  UserHomeViewController.swift
//  PostTraining
//
//  Created by Yoso Lukito on 25/04/23.
//

import UIKit
import CoreData

class UserHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    var arrOfMenuName = [String]()
    var arrOfMenuPrice = [Int]()
    var arrOfMenuStock = [Int]()
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrOfMenuName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "usercell") as! UserTableViewCell
        
        // instantiate
        cell.menuNameLbl.text = arrOfMenuName[indexPath.row]
        cell.menuPriceLbl.text = String(arrOfMenuPrice[indexPath.row])
        cell.menuStockLbl.text = String(arrOfMenuStock[indexPath.row])
        
        
        cell.detailHandler = {
            
        }
        
        return cell 
    }

    
    @IBOutlet weak var listMenuTv: UITableView!
    
    var context : NSManagedObjectContext!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        listMenuTv.delegate = self
        listMenuTv.dataSource = self
        
        loadData()
    }
    
    
    // send to detail
    func toDetail(){
        
        if let nextView = storyboard?.instantiateViewController(identifier: "OrderViewController"){
            
            
            
            navigationController?.pushViewController(nextView, animated: true)
        }
        
    }
    
    
    // load data
    func loadData(){
        arrOfMenuName.removeAll()
        arrOfMenuPrice.removeAll()
        arrOfMenuStock.removeAll()
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        
        do {
            
            let results = try context.fetch(request) as! [NSManagedObject]
            
            for data in results{
                arrOfMenuName.append(data.value(forKey: "productName") as! String)
                
                arrOfMenuPrice.append(data.value(forKey: "productPrice") as! Int)
                
                arrOfMenuStock.append(data.value(forKey: "productQty") as! Int)
                
            }
            
            listMenuTv.reloadData()
            
        } catch {
            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
