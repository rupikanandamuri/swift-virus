//
//  ViewController.swift
//  swiftVirusProject
//
//  Created by Rupika on 2020-04-08.
//  Copyright © 2020 Rupika. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK:Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateOfBirthPicker: UIDatePicker!
    @IBOutlet weak var displayAgeLabel: UILabel!
    @IBOutlet weak var toggle: UISwitch!
    
    var datasource = Datasource.shared
    var patientData: Patient?
    
//    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//    var aVariable :Datasource?
    
      //MARK:Default
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //aVariable = self.appDelegate.data
        applyDateRange()
    }
    
    func applyDateRange(){
        var component    = DateComponents()
        component.year   = -150
        let theCalendar     = Calendar.current
        let result        = theCalendar.date(byAdding: component, to: Date())
        dateOfBirthPicker.maximumDate = Date()
        dateOfBirthPicker.minimumDate = result
    }
    
    @IBAction func datePicked(_ sender: UIDatePicker) {
        let birthday = sender.date
        let presentDate = Date()
        let calendar = Calendar(identifier: .gregorian)
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: presentDate)
        let currentYear = ageComponents.year
        if let age = currentYear{
            displayAgeLabel.text = String(age)
        }
    }
    
    //MARK:Actions
    @IBAction func submitDetailsPressed(_ sender: Any) {
        
        var nameMissing = false
        var dobMissing = false
        
        if nameTextField.text == "" || nameTextField.text == nil {
            nameMissing = true
        }
        if displayAgeLabel.text == "" || displayAgeLabel.text == nil {
           dobMissing = true
        }
        
        if nameMissing || dobMissing{
            if nameMissing && dobMissing {
                alertBox(title: "Missing info", msg: "Name and dob are missing")
            }else{
                if nameMissing{
                    alertBox(title: "Missing info", msg: "Name is missing")
                }
                if dobMissing{
                    alertBox(title: "Missing info", msg: "DOB is missing")
                }
            }
        }else{
       
        patientData = Patient()
        patientData?.patientName = nameTextField.text!
        patientData?.ptientDateOfBirth = dateOfBirthPicker.date
        patientData?.patientAge = Int(displayAgeLabel.text!)!
        patientData?.travelled =  toggle.isOn
        
        //check data for priority
        checkPriority()
        
        if patientData?.priority ?? 0 > 0{
            //add to array
             patientData?.waitingNum = datasource.testNeeded.count 
            datasource.addPatient(patient: patientData!, shouldNeedTesting: true)
            
        }else{
            datasource.addPatient(patient: patientData!, shouldNeedTesting: false)
        }
        
        performSegue(withIdentifier: "showPatient", sender: nil)
        
       nameTextField.text = ""
       displayAgeLabel.text = ""
       toggle.isOn = false
       dateOfBirthPicker.date = Date()
       }
    }
    
    func checkPriority(){
        guard let patient = patientData else {
            return
        }
       if patient.patientAge! > 65 && patient.travelled! == true {
            patientData?.priority = 3
        }
       else if patient.patientAge! > 65 {
            patientData?.priority = 2
        }
       else if patient.travelled == true{
            patientData?.priority = 1
        }
       else if patient.patientAge! <= 65 && patient.travelled == false {
            patientData?.priority = 0
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? DisplayResult {
            if let getDataFromPatient = patientData{
                vc.patientValue = getDataFromPatient
            }
            
        }
    }
    func alertBox(title: String, msg: String){
        
        // create the alert
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
       
        // show the alert
        self.present(alert, animated: true)
    }
 
}

