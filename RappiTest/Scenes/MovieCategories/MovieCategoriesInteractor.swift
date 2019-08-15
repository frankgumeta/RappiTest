//
//  MovieCategoriesInteractor.swift
//  RappiTest
//
//  Created by Francisco Eduardo Toledo Gumeta on 8/12/19.
//  Copyright © 2019 Frank Gumeta. All rights reserved.
//

import Foundation

protocol MovieCategoriesInteractorLogic {
    func loadData()
}

class MovieCategoriesInteractor {
    var presenter: MovieCategoriesPresenter?
}

extension MovieCategoriesInteractor: MovieCategoriesInteractorLogic {
    func loadData() {
        MovieCategoriesWorker.loadCategories{ categories in
            self.presenter?.displayData(categories: categories)
        }
    }
}
