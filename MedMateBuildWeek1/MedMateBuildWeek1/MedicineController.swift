//
//  MedicineController.swift
//  MedMateBuildWeek1
//
//  Created by Stephanie Ballard on 2/4/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

class MedicineController {
    
    func createMedicine(name: String, dose: Double ) {
        let newMed = Medication(name: name, dose: dose)//unwrapp and convert to a double
    }

    func createNote() {
        
    }

    func saveToPersistence() {
        //saving to a file make sure you change that name for plist
        
    }
    
    func loadFromPersistence() {
        
    }
    
    func deleteMedicine() {
        
    }
}

