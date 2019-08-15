//
//  MovieCategoriesPresenter.swift
//  RappiTest
//
//  Created by Francisco Eduardo Toledo Gumeta on 8/12/19.
//  Copyright © 2019 Frank Gumeta. All rights reserved.
//

import Foundation

protocol MovieCategoriesPresenterLogic {
    func displayData(categories: MovieCatalogViewModel)
}

class MovieCategoriesPresenter {
    weak var controller: MovieCategoriesController?
}

extension MovieCategoriesPresenter: MovieCategoriesPresenterLogic {
    func displayData(categories: MovieCatalogViewModel) {
        controller?.displayData(categories: categories)
    }
}
