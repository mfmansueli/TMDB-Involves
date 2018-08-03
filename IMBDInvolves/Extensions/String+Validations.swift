//
//  String+Validations.swift
//  IMDBInvolves
//
//  Created By Mateus on 24/01/18.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import Foundation

extension String {

    func formattedDateFromString(currentFormat: String, withFormat format: String) -> String {
        if self.isEmpty {
            return self
        }
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = currentFormat
        
        let date: Date = inputFormatter.date(from: self)!
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = format
        outputFormatter.locale =  Locale(identifier: R.string.localizable.localeIdentifier())
        
        return outputFormatter.string(from: date)
    }
    
    var emptyValue: String {
        return ""
    }

    var isValidEmail: Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }

    var isValidPassword: Bool {
        return count >= 6
    }

}
