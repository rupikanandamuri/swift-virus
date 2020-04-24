//
//  TestNotRquired.swift
//  swiftVirusProject
//
//  Created by Rupika on 2020-04-08.
//  Copyright © 2020 Rupika. All rights reserved.
//

import UIKit

class TestNotRquired: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableViewData: UITableView!
    //to get the data source
    var datasource = Datasource.shared
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableViewData.reloadData()
    }
    
    //MARK:DEfault methods from delagate and data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return datasource.testNotNeeded.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableViewData.dequeueReusableCell(withIdentifier: "testnotNeeded", for: indexPath) as? TestNotRequiredTableViewCell{
            let patientData = datasource.testNotNeeded[indexPath.row]
            cell.NameLabel.text = patientData.patientName ?? ""
            if let age = patientData.patientAge{
                cell.ageLabel.text = String(age)
            }
            if let tarvel = patientData.travelled{
                if tarvel == false{
                    cell.TravelledLabel.text = "No"
                }
            }
            return cell
        }
        return UITableViewCell()
    }
    //for increase size of table view
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
