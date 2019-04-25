//
//  CollectionViewCell.swift
//  IMBDInvolves
//
//  Created by Mateus on 11/07/2018.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import Foundation

final class NativeComponentsUtil {
    
    static let prefsOboarding: String = "onboarding"
    static let prefsUrl: String = "baseUrl"
    static let tokenPush: String = "tokenPush"
    static let prefsAuthorization: String = "authorization"
    
    static func getSharedPreferencesString(key: String) -> String {
        if let prefsString = UserDefaults.standard.value(forKey: key) as? String, !prefsString.isEmpty {
            return prefsString
        }
        
        return ""
    }
    
    static func getSharedPreferencesBool(key: String) -> Bool! {
        if let prefsString = UserDefaults.standard.value(forKey: key) as? String, !prefsString.isEmpty {
            return Bool(prefsString)
        }
        
        return false
    }
    
    static func saveSharedPreferencesString(value: String, key: String) {
        UserDefaults.standard.setValue(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
}
