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
    
    var meds = [Medication]()
    let medicineController = MedicineController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        medicationsTableView.delegate = self
        medicationsTableView.dataSource = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        medicationsTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meds.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationCell", for: indexPath) as? MedicationTableViewCell else { return UITableViewCell() }
        
        return cell
        
      }

    @IBAction func notesForDoctorTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func addMedicationTapped(_ sender: UIBarButtonItem) {
    }
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NotesForDoctorShowSegue" {
            if let notesVC = segue.destination as? NotesViewController {
                //notesVC.delegate = self //need to pass over information
            }
        } else if segue.identifier == "AddMedicationShowSegue" {
            if let indexPath = medicationsTableView.indexPathForSelectedRow,
            let addMedicationsVC = segue.destination as? AddMedicationDetailsViewController {
                addMedicationsVC.med = meds[indexPath.row]
                addMedicationsVC.medsController = self.medicineController
            }
        }
    }

}
