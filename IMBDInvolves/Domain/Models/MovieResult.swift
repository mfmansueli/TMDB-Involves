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
//    var page: Int = 0
//    var total_results: Int = 0
//    var total_pages: Int = 0
    
    private enum CodingKeys : String, CodingKey {
        case results = "results"
//        case voteAverage = "vote_average"
//        case posterPath = "poster_path"
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//        case genreId = "genre_ids"
//        case backdropPath = "backdrop_path"
//        case releaseDate = "release_date"
    }
}
