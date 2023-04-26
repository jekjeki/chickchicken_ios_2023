//
//  UserTableViewCell.swift
//  PostTraining
//
//  Created by Yoso Lukito on 25/04/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var menuNameLbl: UILabel!
    
    @IBOutlet weak var menuPriceLbl: UILabel!
    
    
    @IBOutlet weak var menuStockLbl: UILabel!
    
    
    var detailHandler = { }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
    
}
