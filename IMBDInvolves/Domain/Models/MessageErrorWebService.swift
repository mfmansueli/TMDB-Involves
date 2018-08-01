//
//  MessageError.swift
//  IMBDInvolves
//
//  Created by Mateus on 16/07/2018.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import Foundation

final class MessageErrorWebService: Codable {
    var code: Int = 0
    var message: String = ""
    
    init (code: Int, message: String) {
        self.code = code
        self.message = message
    }
    
    private enum CodingKeys : String, CodingKey {
        case code = "status_code"
        case message = "status_message"
    }
}
