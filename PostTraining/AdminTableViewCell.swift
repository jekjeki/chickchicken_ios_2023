//
//  AdminTableViewCell.swift
//  PostTraining
//
//  Created by Yoso Lukito on 24/04/23.
//

import UIKit

class AdminTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var menuNameTvc: UILabel!
    var deleteHandler = { }
    @IBOutlet weak var menuPriceTvc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

    @IBAction func deleteClick(_ sender: Any) {
        deleteHandler() 
    }
}
