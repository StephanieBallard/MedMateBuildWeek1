//
//  MedicationsListViewController.swift
//  MedMateBuildWeek1
//
//  Created by Stephanie Ballard on 2/3/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class MedicationsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var medicationsTableView: UITableView!
    
    let medicineController = MedicineController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        medicationsTableView.delegate = self
        medicationsTableView.dataSource = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        medicationsTableView.reloadData()
        setTheme()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicineController.medicines.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationCell", for: indexPath) as? MedicationTableViewCell else { return UITableViewCell() }
        
        let med = medicineController.medicines[indexPath.row]
        cell.med = med
        
        return cell
        
      }

    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
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
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
        if segue.identifier == "DetailShowSegue" {
            if let indexPath = medicationsTableView.indexPathForSelectedRow,
                let addMedicationsVC = segue.destination as? AddMedicationDetailsViewController {
                addMedicationsVC.med = medicineController.medicines[indexPath.row]
                addMedicationsVC.medsController = self.medicineController
                addMedicationsVC.themeHelper = self.themeHelper
                
            }
        } else if segue.identifier == "AddMedicationShowSegue" {
            if let addMedicationsVC = segue.destination as? AddMedicationDetailsViewController {
                addMedicationsVC.medsController = self.medicineController
                addMedicationsVC.themeHelper = self.themeHelper
            }
            
        } else if segue.identifier == "ThemeSelectionModalSegue" {
            if let addMedicationsVC = segue.destination as? ThemeViewController {
                addMedicationsVC.themeHelper = themeHelper
            }
            
            
        }
        
    }
}
