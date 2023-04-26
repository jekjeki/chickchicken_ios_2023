//
//  ForgotPassword2ViewController.swift
//  PostTraining
//
//  Created by Yoso Lukito on 24/04/23.
//

import UIKit
import CoreData

class ForgotPassword2ViewController: UIViewController {
    
    var getEmail:String = ""

    var context : NSManagedObjectContext!
    
    @IBOutlet weak var newPasswordTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        context = appDelegate.persistentContainer.viewContext
    }
    
    
    @IBAction func resetPasswordClick(_ sender: Any) {
        
        var errMsg = ""
        
        // new pw
        let newPw = newPasswordTf.text!
        
        // check new password is empty
        if(newPw.isEmpty){
            errMsg = "the new password field cannot empty !"
        }
        else{
            
            // success
            errMsg = "success update pw"
            
            // update pw
            
            // fetch data from core
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            
            request.predicate = NSPredicate(format: "email==%@", getEmail)
            
            do{
                guard let result = try context.fetch(request) as? [NSManagedObject] else {
                    return
                }
                
                // get obj
                guard let obj = result.first else {
                    return
                }
                
                // set value
                obj.setValue(newPw, forKey: "password")
                
                // save the new data
                do{
                    try context.save()
                    print("data updated")
                    
                    // direct to login page
                    if let nextView = storyboard?.instantiateViewController(withIdentifier: "LoginViewController"){
                        
                        navigationController?.pushViewController(nextView, animated: true)
                        
                    }
                    
                } catch let error as NSError {
                    
                    print(error)
                    
                }
                
            } catch let error as NSError {
                print(error)
            }
        }
        
        print(errMsg)
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
