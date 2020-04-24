//
//  DisplayResult.swift
//  swiftVirusProject
//
//  Created by Rupika on 2020-04-08.
//  Copyright © 2020 Rupika. All rights reserved.
//

import UIKit

class DisplayResult: UIViewController {
    //MARK:Outlets
    @IBOutlet weak var priotiyNoLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var waitingListLabel: UILabel!
    @IBOutlet weak var priorityResultLabel: UILabel!
    @IBOutlet weak var waitingListDisplayLabel: UILabel!
    var patientValue = Patient()
    
    //MARK:Default
    override func viewDidLoad() {
        super.viewDidLoad()
        if patientValue.priority == 0 {
            resultLabel.text = "No Test Required For you!!!"
            resultLabel.textColor = UIColor.blue
            waitingListLabel.isHidden = true
            priotiyNoLabel.isHidden = true
            waitingListDisplayLabel.isHidden = true
            priorityResultLabel.isHidden = true
        }else{
            resultLabel.text = "You Required Test For Virus!!!"
            priotiyNoLabel.text = String(patientValue.priority  ?? 0)
            waitingListLabel.text = String(patientValue.waitingNum ?? 0)
            waitingListDisplayLabel.isHidden = false
            priorityResultLabel.isHidden = false
        }
        
        // Do any additional setup after loading the view.
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.popViewController(animated: false)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    //MARK:Actions
    
}
