//
//  Validator.swift
//  IMBDInvolves
//
//  Created by Mateus on 12/07/2018.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import Foundation

struct Validator {
    
    static func isEmpty(_ value: String?) -> Bool {
        guard let value = value else { return true }
        return value.isEmpty
    }
}
