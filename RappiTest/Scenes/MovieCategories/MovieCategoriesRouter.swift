//
//  MovieCategoriesRouter.swift
//  RappiTest
//
//  Created by Francisco Eduardo Toledo Gumeta on 8/12/19.
//  Copyright © 2019 Frank Gumeta. All rights reserved.
//

import UIKit

protocol MovieCategoriesRoutable {
    func navigateToMovieList(with category:MovieCategoryViewModel)
}

class MovieCategoriesRouter {
    weak var controller: MovieCategoriesController?
}

extension MovieCategoriesRouter: MovieCategoriesRoutable {
    func navigateToMovieList(with category: MovieCategoryViewModel) {
        let listController = UIStoryboard.controller(with: MovieListController.self)
        listController.currentCategory = category
        controller?.show(listController, sender: nil)
    }
    
}
