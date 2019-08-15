//
//  URLBuilder.swift
//  RappiTest
//
//  Created by Francisco Eduardo Toledo Gumeta on 8/12/19.
//  Copyright © 2019 Frank Gumeta. All rights reserved.
//

import Foundation

enum MovieCategory: Int, CaseIterable {
    case popular
    case topRated
    case upcoming
}

class URLGenerator {
    
    private static let baseURL        = "https://api.themoviedb.org/3/movie/"
    private static let imageBaseURL   = "https://image.tmdb.org/t/p/w500"
    private static let apiKey         = "3be239b232f6574a6824a27cabebc3e5"
    private static let language       = "&language=en-US"
    private static let page           = "&page=1"
    private static let popularMovies  = "popular"
    private static let upcomingMovies = "upcoming"
    private static let topRatedMovies = "top_rated"
    
    class func url(forCategory category: MovieCategory) -> URL {
        var rawURL = baseURL
        switch category {
        case .popular   : rawURL += popularMovies
        case .topRated  : rawURL += topRatedMovies
        case .upcoming  : rawURL += upcomingMovies
        }
        rawURL += "?api_key=" + apiKey
        rawURL += language
        rawURL += page
        guard let url = URL(string: rawURL) else {
            fatalError("URL was not generated")
        }
        
        return url
    }
    
    class func url(forPoster path: String) -> URL? {
        let urlString = imageBaseURL + path
        return URL(string: urlString)
    }
    
}


