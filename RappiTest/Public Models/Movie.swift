//
//  Movie.swift
//  RappiTest
//
//  Created by Francisco Eduardo Toledo Gumeta on 8/12/19.
//  Copyright © 2019 Frank Gumeta. All rights reserved.
//

import Foundation

typealias MovieCategoryViewModel = [String: [Movie]]
typealias MovieCatalogViewModel  = [MovieCategoryViewModel]

struct Movie: Codable {
    let voteCount       : Int
    let id              : Int
    let video           : Bool
    let voteAverage     : Double
    let title           : String
    let popularity      : Double
    let posterPath      : String
    let originalLanguage: String
    let originalTitle   : String
    let genres          : [Int]
    let backdropPath    : String
    let adult           : Bool
    let overview        : String
    let releaseDate     : String
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case video
        case title
        case popularity
        case adult
        case overview
        case posterPath         = "poster_path"
        case originalLanguage   = "original_language"
        case originalTitle      = "original_title"
        case genres             = "genre_ids"
        case backdropPath       = "backdrop_path"
        case releaseDate        = "release_date"
        case voteAverage        = "vote_average"
        case voteCount          = "vote_count"
    }
}
