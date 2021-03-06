//
//  MedicationTableViewCell.swift
//  MedMateBuildWeek1
//
//  Created by Stephanie Ballard on 2/3/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class MedicationTableViewCell: UITableViewCell {

    @IBOutlet weak var medicationLabel: UILabel!
    @IBOutlet weak var dosageLabel: UILabel!
    @IBOutlet weak var reminderLabel: UILabel!
    @IBOutlet weak var noteButton: UIButton!
    
    var med: Medication? {
        didSet {
            updateViews()
        }
    }
    
    
    private func updateViews() {
        
        guard let med = med else { return }
        
        let dosageText = String(med.dose)
        
        medicationLabel.text = med.name
        dosageLabel.text = dosageText
        reminderLabel.text = df.string(from: med.date)
        
    }
    
    var df: DateFormatter {
       let formatter = DateFormatter()
       formatter.dateFormat = "HH:mm"
       formatter.timeZone = TimeZone(secondsFromGMT: 0)
       return formatter
    }
    

}
