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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationCell", for: indexPath)
        
        let medicationData = meds[indexPath.row]
        
        cell.textLabel?.text = medicationData.name
        
        return cell
        
      }

    @IBAction func notesForDoctorTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func addMedicationTapped(_ sender: UIBarButtonItem) {
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
