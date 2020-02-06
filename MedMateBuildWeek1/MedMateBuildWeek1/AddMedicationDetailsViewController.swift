//
//  AddMedicationDetailsViewController.swift
//  MedMateBuildWeek1
//
//  Created by Stephanie Ballard on 2/3/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class AddMedicationDetailsViewController: UIViewController {
    // //need to pass medicine and medicine controller through segues
    var med: Medication?
    var medsController: MedicineController?
    
    
    @IBOutlet weak var medicationNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dosageLabel: UILabel!
    @IBOutlet weak var dosageTextField: UITextField!
    @IBOutlet weak var scheduleReminderLabel: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveToMedicationListTapped(_ sender: UIButton) {
        guard let name = nameTextField.text,
            let dosage = dosageTextField.text,
        name != "" && dosage != "" else { return }
        
        if let med = med {
            medsController?.update(meds: med, name: name, dosage: Double(dosage)!)
        } else {
           
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    //TODO: unwrapp and convert to a double, Double(dosage) inside a variable and use that for our function //var dosageDouble = Double(dosage)

    /*
    // MARK: - Navigation
     //TODO: segue
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
     //pass them a couple times
    }
    */

}
