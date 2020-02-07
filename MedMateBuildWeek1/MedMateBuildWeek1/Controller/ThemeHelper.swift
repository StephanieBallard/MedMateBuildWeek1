//
//  ThemeHelper.swift
//  MedMateBuildWeek1
//
//  Created by Stephanie Ballard on 2/3/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

extension String {
    static var themePreferenceKey = "themeHelper"
}

class ThemeHelper {
    
    init() {
        guard themePreference == nil
            else { return }
        
    }
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("dark", forKey: .themePreferenceKey )
    }
    
    func setThemePreferenceToPink() {
        UserDefaults.standard.set("pink", forKey: .themePreferenceKey )
    }
    
    
}
