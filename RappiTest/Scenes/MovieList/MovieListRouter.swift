//
//  MovieListRouter.swift
//  RappiTest
//
//  Created by Francisco Eduardo Toledo Gumeta on 8/12/19.
//  Copyright © 2019 Frank Gumeta. All rights reserved.
//

import UIKit

protocol MovieListRouterLogic {
    func navigateToMovieDetail(withMovie: Movie)
}

class MovieListRouter {
     weak var controller: MovieListController?
}

extension MovieListRouter: MovieListRouterLogic {
    func navigateToMovieDetail(withMovie movie: Movie) {
        let detailController = UIStoryboard.controller(with: MovieDetailController.self)
        detailController.currentMovie = movie
        controller?.present(detailController, animated: true, completion: nil)
    }
}
