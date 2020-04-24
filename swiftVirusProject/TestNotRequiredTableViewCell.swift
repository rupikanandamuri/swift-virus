//
//  TestNotRequiredTableViewCell.swift
//  swiftVirusProject
//
//  Created by Rupika on 2020-04-08.
//  Copyright © 2020 Rupika. All rights reserved.
//

import UIKit

class TestNotRequiredTableViewCell: UITableViewCell {

     @IBOutlet weak var NameLabel: UILabel!
     @IBOutlet weak var ageLabel: UILabel!
     @IBOutlet weak var TravelledLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
