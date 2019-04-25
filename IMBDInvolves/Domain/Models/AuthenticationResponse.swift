//
//  AuthenticationResponse.swift
//  IMBDInvolves
//
//  Created by Mateus on 16/07/2018.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import Foundation

final class AuthenticationResponse: Codable {
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
