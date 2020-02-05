//
//  MedicineController.swift
//  MedMateBuildWeek1
//
//  Created by Stephanie Ballard on 2/4/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation



class MedicineController {
    
    var medicines = [Medication]()
    
    func createMedicine(name: String, dose: Double ) {
        let newMed = Medication(name: name, dose: dose)
        
        medicines.append(newMed)
        //TODO : saveToPersistence
        }
        //TODO: unwrapp and convert to a double

    func createNote() {
        
    }
    
    var medicationListURL: URL? {
        let fileManager = FileManager.default
        
        guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let medicationsURL = documentsDir.appendingPathComponent("MedicationList.plist")
        
        return medicationsURL
    }
    //saving to a file make sure you change that name for plist
   
    func saveToPersistence() {
        
        guard let fileURL = medicationListURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            
            let medicationsData = try encoder.encode(medicines)
            
            try medicationsData.write(to: fileURL)
            
        } catch {
            print("Error encoding medicines array: \(medicines)")
            
        }
    }
    
    func loadFromPersistence() {
        guard let fileURL = medicationListURL else { return }
        
        do {
            
            let medicationsData = try Data(contentsOf: fileURL)
            
            let decoder = PropertyListDecoder()
            
            let medicationsArray = try decoder.decode([Medication].self, from: medicationsData)
            
            self.medicines = medicationsArray
            
        } catch {
            print("Error decoding medicines: \(error)")
            
        }
    }
    
    func deleteMedicine(named medicine: Medication) {
        guard let index = medicines.firstIndex(of: medicine) else { return }
        medicines.remove(at: index)
        
        saveToPersistence()
        
    }
}

