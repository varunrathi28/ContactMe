//
//  ContactImageCell.swift
//  ContactMe
//
//  Created by Varun Rathi on 07/12/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class ContactImageCell: UITableViewCell {
    
    @IBOutlet weak var backgroundImageView:UIImageView!
    @IBOutlet weak var  profileImageView:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
