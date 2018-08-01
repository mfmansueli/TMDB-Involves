//
//  Movie.swift
//  IMBDInvolves
//
//  Created by Mateus on 31/07/2018.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import Foundation
import IGListKit

final class Movie: Codable {
    var voteCount: Int = 0
    var id: Int = 0
    var video: Bool = false
    var voteAverage: Double = 0
    var title: String = ""
    var popularity: Double = 0
    var posterPath: String? = ""
    var originalLanguage: String = ""
    var originalTitle: String = ""
    var genreId: [Int] = []
    var backdropPath: String? = ""
    var adult: Bool = false
    var overview: String = ""
    var releaseDate: String = ""
    
    private enum CodingKeys : String, CodingKey {
        case voteCount = "vote_count"
        case id = "id"
        case video = "video"
        case voteAverage = "vote_average"
        case title = "title"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreId = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult = "adult"
        case overview = "overview"
        case releaseDate = "release_date"
    }
}

extension Movie: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Movie else { return false }
        return id == object.id
    }
}

