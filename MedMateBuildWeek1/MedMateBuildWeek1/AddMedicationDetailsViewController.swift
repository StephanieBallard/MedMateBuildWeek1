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
    var themeHelper: ThemeHelper?
    var timer: Timer?
    
    @IBOutlet weak var medicationNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dosageLabel: UILabel!
    @IBOutlet weak var dosageTextField: UITextField!
    @IBOutlet weak var scheduleReminderLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let textView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        setTheme()
        
        
                textView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
                textView.backgroundColor = .lightGray
                textView.text = "Please use this section to note anything you'd like to remember to tell your doctor at your next visit!"
                
                view.addSubview(textView)
                //use auto layout to set up constraints
                textView.translatesAutoresizingMaskIntoConstraints = false
                [
                    textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                    textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    textView.heightAnchor.constraint(equalToConstant: 50)
                    
                    ].forEach{ $0.isActive = true}
                
                textView.font = UIFont.preferredFont(forTextStyle: .headline)
                
                textView.delegate = self
                textView.isScrollEnabled = false
                
                textViewDidChange(textView)
            
        }
    
    
    
    @IBAction func saveToMedicationListTapped(_ sender: UIBarButtonItem) {
        guard let name = nameTextField.text,
            let dosage = dosageTextField.text,
            let notesTextView = textView.text,
        name != "" && dosage != "" else { return }
        
        if let med = med {
            medsController?.update(meds: med, name: name, dosage: Double(dosage)!, note: notesTextView, date: datePicker.date)
        } else {
           
            medsController?.createMedicine(name: name, dose: Double(dosage)!, note: notesTextView, date: datePicker.date)
            
        }
        
        navigationController?.popViewController(animated: true)
        

        func startTimer() {
                    func startTimer() {
                        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: updateAlert(timer:))
                }
                func showAlert() {
                        let alert = UIAlertController(title: "Medicine", message: "It's time to take your medication!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Medicine", style: .default, handler: nil))
                        present(alert, animated: true)
                    }
            
            func updateAlert(timer: Timer) {
                        showAlert()
                   }
                }
    }
        
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        var backgroundColor: UIColor!
        
        switch themePreference {
        case "dark":
            backgroundColor = .darkGray
        case "pink":
            backgroundColor = .systemPink
        default:
            break
        }
        
        view.backgroundColor = backgroundColor
        
    }

    func updateViews() {
        guard let med = med else { title = " Create New Med"
            return }
        
        guard let dosageString = dosageTextField.text else { return }
        var dosageDouble = Double(dosageString)
        
        nameTextField.text = med.name
        dosageDouble = med.dose
        textView.text = med.note
        datePicker.date = med.date
        
        title = med.name
        
        
        
    }
}

extension AddMedicationDetailsViewController: UITextViewDelegate {
         public func textViewDidChange(_ textView: UITextView) {
             //print(textView.text)
             let size = CGSize(width: view.frame.width, height: .infinity)
             let estimatedSize = textView.sizeThatFits(size)
             
             textView.constraints.forEach { (constraint) in
                 if constraint.firstAttribute == .height {
                     constraint.constant = estimatedSize.height
                 }
             }
         }
     }
