//
//  AdminListViewController.swift
//  PostTraining
//
//  Created by Yoso Lukito on 24/04/23.
//

import UIKit
import CoreData

class AdminListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrMenuName = [String]()
    var arrMenuPrice = [Int]()
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrMenuName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AdminTableViewCell
        
        cell.menuNameTvc.text = arrMenuName[indexPath.row]
        cell.menuPriceTvc.text = String(arrMenuPrice[indexPath.row])
        
        cell.deleteHandler = {
            self.deleteData(cell: cell, indexPath: indexPath)
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
    
    
    // delete row data
    func deleteData(cell:UITableViewCell, indexPath:IndexPath){
        
        arrMenuName.remove(at: indexPath.row)
        arrMenuPrice.remove(at: indexPath.row)
        listMenuTv.deleteRows(at: [indexPath], with: .fade)
        
        listMenuTv.reloadData()
    }
    
    
    // load the data
    func loadData(){
        arrMenuName.removeAll()
        arrMenuPrice.removeAll()
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        
        do {
            let results = try context.fetch(request) as! [NSManagedObject]
            
            for data in results {
                arrMenuName.append(data.value(forKey: "productName") as! String)
                
                arrMenuPrice.append(data.value(forKey: "productPrice") as! Int)
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
