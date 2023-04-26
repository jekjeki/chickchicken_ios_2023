//
//  ForgotPasswordViewController.swift
//  PostTraining
//
//  Created by Yoso Lukito on 23/04/23.
//

import UIKit
import CoreData

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var EmailTf: UITextField!
    var context:NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        context = appDelegate.persistentContainer.viewContext
    }
    

    
    @IBAction func nextToPasswordForgot(_ sender: Any) {
        print("clicked")
        
        let emailTxt = EmailTf.text
        
        // get the entity
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        request.predicate = NSPredicate(format: "email==%@", emailTxt!)
        
        do{
            let result = try context.fetch(request) as! [NSManagedObject]
            
            if(result.count==0){
                print("email not valid !")
            }
            else {
                
                print("valid")
                
                let vc = storyboard?.instantiateViewController(withIdentifier: "ForgotPassword2ViewController") as! ForgotPassword2ViewController
                
                let nc = UINavigationController(rootViewController: vc)
                
                vc.getEmail = emailTxt!
                
                self.present(nc, animated: true)
                
            }
            
        } catch {
            print("unexpected error")
        }
        
    }
    

}
