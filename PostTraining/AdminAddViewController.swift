//
//  AdminAddViewController.swift
//  PostTraining
//
//  Created by Yoso Lukito on 24/04/23.
//

import UIKit
import CoreData

class AdminAddViewController: UIViewController {

    
    @IBOutlet weak var menuNameTf: UITextField!
    @IBOutlet weak var menuPriceTf: UITextField!
    @IBOutlet weak var menuQtyTf: UITextField!
    @IBOutlet weak var menuDescTf: UITextField!
    
    var context:NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        context = appDelegate.persistentContainer.viewContext
    }
    

    @IBAction func addProductClick(_ sender: Any) {
        
        // data
        let menuName = menuNameTf.text
        let menuPrice = Int(menuPriceTf.text!)
        let menuQty = Int(menuQtyTf.text!)
        let menuDesc = menuDescTf.text
        
        // get entity
        let prodEntity = NSEntityDescription.entity(forEntityName: "Product", in: context)
        
        // add
        let prod = NSManagedObject(entity: prodEntity!, insertInto: context)
        
        prod.setValue(menuName, forKey: "productName")
        prod.setValue(menuPrice, forKey: "productPrice")
        prod.setValue(menuQty, forKey: "productQty")
        prod.setValue(menuDesc, forKey: "productDesc")
        
        do {
            try context.save()
            print("new menu saved")
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
