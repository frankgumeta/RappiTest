//
//  MovieCategoriesWorker.swift
//  RappiTest
//
//  Created by Francisco Eduardo Toledo Gumeta on 8/12/19.
//  Copyright © 2019 Frank Gumeta. All rights reserved.
//

import Foundation

class MovieCategoriesWorker {
    static let categoriesFileName = "categories.data"
    class func loadCategories(completion: @escaping (_ result: MovieCatalogViewModel) -> Void) {
        if let categories = StorageManager.fetchEntity(categoriesFileName, as: MovieCatalogViewModel.self) {
            completion(categories)
        } else {
            Networker.fetchCategories { categories in
                StorageManager.saveEntity(categories, as: categoriesFileName)
                completion(categories)
            }
        }
    }
}
