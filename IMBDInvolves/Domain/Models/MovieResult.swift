//
//  Result.swift
//  IMBDInvolves
//
//  Created by Mateus on 31/07/2018.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import Foundation

final class MovieResult: Codable {
    var results: [Movie] = []
    
    init(results: [Movie]) {
        self.results = results
    }
    
    private enum CodingKeys : String, CodingKey {
        case results = "results"
    }
}
