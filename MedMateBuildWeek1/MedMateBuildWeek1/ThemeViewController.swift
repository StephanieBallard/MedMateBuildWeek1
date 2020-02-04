//
//  ThemeViewController.swift
//  MedMateBuildWeek1
//
//  Created by Stephanie Ballard on 2/3/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class ThemeViewController: UIViewController {
    
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func darkThemeSelected(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func lightThemeSelected(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToTeal()
        dismiss(animated: true, completion: nil)
    }
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        var backgroundColor: UIColor!
        
        switch themePreference {
        case "dark":
            backgroundColor = .darkGray
        case "teal":
            backgroundColor = .systemTeal
        default:
            break
        }
        
        view.backgroundColor = backgroundColor
        
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
