//
//  OrderViewController.swift
//  PostTraining
//
//  Created by Yoso Lukito on 25/04/23.
//

import UIKit

class OrderViewController: UIViewController {

    
    @IBOutlet weak var menuNameLbl: UILabel!
    
    @IBOutlet weak var menuDescLbl: UILabel!
    
    @IBOutlet weak var menuPriceLbl: UILabel!
    
    @IBOutlet weak var menuStockLbl: UILabel!
    
    @IBOutlet weak var orderQtyTf: UITextField!
    
    
    var menuName : String = ""
    var menuDesc : String = ""
    var menuPrice : Int = 0
    var menuStock : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuNameLbl.text = menuName
        menuDescLbl.text = menuDesc
        menuPriceLbl.text = String(menuPrice)
        menuStockLbl.text = String(menuStock)
        
        
    }
    

    @IBAction func orderClicked(_ sender: Any) {
        
    }
    

}
