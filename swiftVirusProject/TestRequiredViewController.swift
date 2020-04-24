//
//  TestRequiredViewController.swift
//  swiftVirusProject
//
//  Created by Rupika on 2020-04-08.
//  Copyright © 2020 Rupika. All rights reserved.
//

import UIKit

class TestRequiredViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    //MARK:Outlets
    @IBOutlet weak var tableViewData: UITableView!
    //to get the data source
    var datasource = Datasource.shared
    
    //MARK:Default Function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableViewData.reloadData()
    }
    //MARK:Actions and functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.testNeeded.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableViewData.dequeueReusableCell(withIdentifier: "testNeeded", for: indexPath) as? TestRequiredTableViewCell{
            let patientNeddTestData = datasource.testNeeded[indexPath.row]
            if let colorForPriority = patientNeddTestData.priority{
                if colorForPriority ==  3{
                    cell.ageLabel.textColor = UIColor.red
                    cell.displayAgeLabel.textColor = UIColor.red
                    cell.priorityNoLabel.textColor =  UIColor.red
                    cell.displayPriorityLabel.textColor = UIColor.red
                    cell.displayNameLabel.textColor = UIColor.red
                    cell.NameLabel.textColor =  UIColor.red
                }
                else if colorForPriority == 2{
                    cell.ageLabel.textColor =  UIColor.orange
                    cell.displayAgeLabel.textColor = UIColor.orange
                    cell.priorityNoLabel.textColor = UIColor.orange
                    cell.displayPriorityLabel.textColor = UIColor.orange
                    cell.displayNameLabel.textColor = UIColor.orange
                    cell.NameLabel.textColor = UIColor.orange
                }
                else if colorForPriority == 1{
                    cell.ageLabel.textColor =  UIColor.green
                    cell.displayAgeLabel.textColor = UIColor.green
                    cell.priorityNoLabel.textColor = UIColor.green
                    cell.displayPriorityLabel.textColor = UIColor.green
                    cell.displayNameLabel.textColor = UIColor.green
                    cell.NameLabel.textColor = UIColor.green
                }
                cell.NameLabel.text = patientNeddTestData.patientName
                
                if let age = patientNeddTestData.patientAge{
                    cell.ageLabel.text = String(age)
                }
                if let priorityValue = patientNeddTestData.priority{
                    cell.priorityNoLabel.text = String(priorityValue)
                }
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // let getSelectPatient = datasource.testNeeded[indexPath.row]
        alertBox(indexSelected: indexPath)
    }
    
    func alertBox(indexSelected:IndexPath){
        
        // create the alert
        let alert = UIAlertController(title: "Test done", message: "Click yes to remove patient from list. If test is done or else click no if test is not done.", preferredStyle: .alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "no", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "yes", style: UIAlertAction.Style.default, handler: {
            action in
            self.datasource.testNeeded.remove(at: indexSelected.row)
            self.tableViewData.reloadData()
        }))
        // show the alert
        self.present(alert, animated: true)
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
