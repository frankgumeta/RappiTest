//
//  Networker.swift
//  RappiTest
//
//  Created by Francisco Eduardo Toledo Gumeta on 8/12/19.
//  Copyright © 2019 Frank Gumeta. All rights reserved.
//

import Foundation

fileprivate struct Constants {
    static let popularMovies  = "Popular"
    static let upcomingMovies = "Upcoming"
    static let topRatedMovies = "Top Rated"
}

class Networker {
    
    class func fetchCategories(completion: @escaping (MovieCatalogViewModel) -> Void) {
        var response = MovieCatalogViewModel()
        let queue = OperationQueue()
        let cagetories: [MovieCategory] = [.popular, .topRated, .upcoming]
        
        let fetchInfoBlock = BlockOperation {
            let group = DispatchGroup()
        
            for category in cagetories {
                group.enter()
                getCategoryResponse(for: category, completion: { categoryResponse in
                    response.append(categoryResponse)
                    group.leave()
                })
            }
            group.wait()
        }
        
        let finalBlock = BlockOperation { completion(response) }
        
        finalBlock.addDependency(fetchInfoBlock)
        queue.addOperation(fetchInfoBlock)
        queue.addOperation(finalBlock)
    }
    
    private class func fetchMovieList(for category: MovieCategory, completion: @escaping (MovieListResponse?) -> Void ) {
        let url = URLGenerator.url(forCategory: category)
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data {
                    let decoder = self.createDecoder()
                    do {
                        let type = MovieListResponse.self
                        let decodedResponse = try decoder.decode(type, from: data)
                        completion(decodedResponse)
                    } catch {
                        completion(nil)
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    private class func getCategoryResponse(for movieCategory: MovieCategory, completion: @escaping (MovieCategoryViewModel) -> Void ) {
        var key: String
        switch movieCategory {
        case .popular: key = Constants.popularMovies
        case.topRated: key = Constants.topRatedMovies
        case.upcoming: key = Constants.upcomingMovies
        }
        
        fetchMovieList(for: movieCategory) { (response) in
            var category = MovieCategoryViewModel()
            category[key] = response?.results
            completion(category)
        }
    }
    
    private class func createDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        return decoder
    }
}

