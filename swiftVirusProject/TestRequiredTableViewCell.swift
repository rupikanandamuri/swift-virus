//
//  TestRequiredTableViewCell.swift
//  swiftVirusProject
//
//  Created by Rupika on 2020-04-09.
//  Copyright © 2020 Rupika. All rights reserved.
//

import UIKit

class TestRequiredTableViewCell: UITableViewCell {

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var displayAgeLabel: UILabel!
    @IBOutlet weak var priorityNoLabel: UILabel!
    @IBOutlet weak var displayPriorityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
