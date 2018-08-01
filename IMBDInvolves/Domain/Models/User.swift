//
//  User.swift
//  IMDBInvolves
//
//  Created By Mateus on 26/10/17.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import Foundation

final class User: Codable {
    var username: String = ""
    var password: String = ""
    var token: String = ""
    
    init (username: String, password: String, token: String) {
        self.username = username
        self.password = password
        self.token = token
    }
    private enum CodingKeys : String, CodingKey {
        case token = "request_token"
    }
}
