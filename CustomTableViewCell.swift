//
//  CustomTableViewCell.swift
//  Diagnosis Now
//
//  Created by Mallika Sansgiri on 1/21/19.
//  Copyright © 2019 Mallika Sansgiri. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var textLab: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
