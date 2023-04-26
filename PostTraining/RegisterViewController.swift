//
//  RegisterViewController.swift
//  PostTraining
//
//  Created by Yoso Lukito on 21/04/23.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var confPasswordTf: UITextField!
    
    var managedContext:NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
    
    
    @IBAction func regBtnClicked(_ sender: Any) {
      
        // init tf and err message
        
        var message = ""
        var flag : Int = 0
        
        let name = nameTf.text!
        let email = emailTf.text!
        let password = passwordTf.text!
        let confPassowrd = confPasswordTf.text!
        
        // check field is empty
        if(name.isEmpty){
            message = "the name cannot empty"
            flag += 1
        }
        else if(email.isEmpty){
            message = "the email cannot empty"
            flag += 1
        }
        else if(password.isEmpty){
            message = "the password cannot empty"
            flag+=1
        }
        else if(confPassowrd.isEmpty){
            message="the confirm password cannot empty"
            flag+=1
        }
        
        // check length
        let msgLenError = "the name length must be greater than 5"
        var checkLen = 0
        
        if(name.count < 5){
            checkLen += 1
        }
        
        // check email field contain @
        var msgCheckEmail = "the email must contains @"
        var checkEmail : Int = 0
        
        for em in email{
            if(em == "@"){
                checkEmail += 1
            }
        }
        
        
        // final check
        if(flag != 0){
            print(message)
        }
        else if(checkLen != 0){
            print(msgLenError)
        }
        else if(checkEmail == 0){
            print(msgCheckEmail)
        }
        else{
            
            
            // create entity
            guard let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext) else { return }
            
            // set value entity
            let newUser = NSManagedObject(entity: userEntity, insertInto: managedContext!)
            
            newUser.setValue(name, forKey: "name")
            newUser.setValue(email, forKey: "email")
            newUser.setValue(password, forKey: "password")
            
            
            // insert value
            do{
                try managedContext.save()
                print("data saved")
            }catch{
                print("failed")
            }
            
        }
        
    }
    

}
