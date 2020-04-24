//
//  DataSource.swift
//  swiftVirusProject
//
//  Created by Rupika on 2020-04-08.
//  Copyright © 2020 Rupika. All rights reserved.
//

import Foundation

class Datasource {
    
    static let shared = Datasource()
    
    var testNeeded: [Patient]
    var testNotNeeded: [Patient]
    
    init() {
        testNeeded = [Patient]()
        testNotNeeded = [Patient]()
    }
    
    func applyPriorityOrdering() {
        testNeeded = testNeeded.sorted(by: { ($0.priority ?? 0) > ($1.priority ?? 0) })
    }
    func applyAlphabeticOrdering(){
        testNotNeeded = testNotNeeded.sorted(by: { ($0.patientName ?? "") < ($1.patientName ?? "") })
    }
    func addPatient(patient: Patient, shouldNeedTesting: Bool)  {
        if shouldNeedTesting{
            self.testNeeded.append(patient)
        }else{
            self.testNotNeeded.append(patient)
        }
        //for sorting array
        applyPriorityOrdering()
        applyAlphabeticOrdering()
    }
    
    func removePatient(patient: Patient, shouldNeedTesting: Bool) {
        self.testNeeded.removeAll {
            $0.patientName == patient.patientName
        }
    }
    
}
