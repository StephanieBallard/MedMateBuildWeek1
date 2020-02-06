//
//  MedicineController.swift
//  MedMateBuildWeek1
//
//  Created by Stephanie Ballard on 2/4/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

// need medicine we are updated, need it's medicine and dosage, need an alert to let the user know it's time to take medicine
//func update(book: Book, withTitle title: String, reasonToRead: String) {
//    guard let index = books.firstIndex(of: book) else { return }
//    
//    var scratch = book
//    
//    scratch.title = title
//    scratch.reasonToRead = reasonToRead
//    
//    books.remove(at: index)
//    books.insert(scratch, at: index)
//}

class MedicineController {
    
    init() {
        loadFromPersistence()
    }
    
    var medicines = [Medication]()
    var notesArray = [String]()
    
    func createMedicine(name: String, dose: Double ) {
        let newMed = Medication(name: name, dose: dose)
        
        medicines.append(newMed)
        saveToPersistence()
        }

    func createNote(note: String) {
        notesArray.append(note)
        saveToPersistence()
    }
    
    var medicationListURL: URL? {
        let fileManager = FileManager.default
        
        guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let medicationsURL = documentsDir.appendingPathComponent("MedicationList.plist")
        
        return medicationsURL
    }
   
    func update(meds: Medication, name: String, dosage: Double) {
        guard let index = medicines.firstIndex(of: meds) else { return }
        
        var scratch = meds
        
        scratch.name = name
        scratch.dose = dosage
        
        medicines.remove(at: index)
        medicines.insert(scratch, at: index)
        
        saveToPersistence()
    }
    
    
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

