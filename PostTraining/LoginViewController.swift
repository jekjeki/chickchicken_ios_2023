//
//  LoginViewController.swift
//  PostTraining
//
//  Created by Yoso Lukito on 23/04/23.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {


    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    var context:NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        context = appDelegate.persistentContainer.viewContext
    }
    
    
    @IBAction func loginClicked(_ sender: Any) {
        
        let emailLogin = emailTF.text
        let passwordLogin = passwordTF.text
        
        
        // check the data user available or not
        
        // fetch data
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        
        
        request.predicate = NSPredicate(format: "email==%@ AND password==%@", emailLogin!, passwordLogin!)
        
        // request core data
        do{
            let result = try context.fetch(request) as! [NSManagedObject]
            
            if(result.count==0){
                print("Failed to login")
            }else{
                
                // success login
                if(emailLogin=="admin@gmail.com")
                {
                    if let nextView = storyboard?.instantiateViewController(withIdentifier: "AdminTabBarController"){
                        
                        navigationController?.pushViewController(nextView, animated: true)
                        
                    }
                }
                else {
                    // for user
                    if let nextView = storyboard?.instantiateViewController(withIdentifier: "UserHomeViewController"){
                        
                        navigationController?.pushViewController(nextView, animated: true)
                        
                    }
                }
                
            }
            
        }catch{
            
        }
    }
    
    
    
    @IBAction func forgotPwClicked(_ sender: Any) {
        
        _ = ForgotPasswordViewController()
        
        if let nextView = storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController"){
            navigationController?.pushViewController(nextView, animated: true)
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
