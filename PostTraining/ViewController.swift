//
//  ViewController.swift
//  PostTraining
//
//  Created by Yoso Lukito on 20/04/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnLoginClick(_ sender: Any) {
        
        let storyboard = self.storyboard?
            .instantiateViewController(withIdentifier: "LoginViewController") as!
        LoginViewController
        
        self.navigationController?
            .pushViewController(storyboard, animated: true)
        
    }
    
    
    @IBAction func btnRegisterClick(_ sender: Any) {
        
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        
        self.navigationController?.pushViewController(storyboard, animated: true)
        
    }
    
}

