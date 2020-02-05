//
//  MedicationModel.swift
//  MedMateBuildWeek1
//
//  Created by Stephanie Ballard on 2/3/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

struct Medication: Codable, Equatable {
    var name: String
    var dose: Double
    var date: Date
    
    init(name: String, dose: Double, date: Date = Date()) {
        self.name = name
        self.dose = dose
        self.date = date
    }
    
}
//saving to pers func should be put inside a create func, every time we create it should be saved to persistence
//when we create a note or save a medacine we call the save to persitence
//create save to per fun and put it inside create funcs
