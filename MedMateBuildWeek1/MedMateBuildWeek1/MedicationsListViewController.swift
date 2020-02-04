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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        medicationsTableView.delegate = self
        medicationsTableView.dataSource = self
        
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

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "AddPOIModalSegue" {
//            if let addPOIVC = segue.destination as? AddPOIViewController {
//                addPOIVC.delegate = self
//            }
//        } else if segue.identifier == "ShowPOIDetailSegue" {
//            if let indexPath = tableView.indexPathForSelectedRow,
//                let poiDetailVC = segue.destination as? POIDetailViewController {
//                poiDetailVC.poi = poiModels[indexPath.row]
//            }
//        }
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
