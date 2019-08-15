//
//  MovieListController.swift
//  RappiTest
//
//  Created by Francisco Eduardo Toledo Gumeta on 8/12/19.
//  Copyright © 2019 Frank Gumeta. All rights reserved.
//

import UIKit

class MovieListController: BaseController {

    //Clean Arch Stack
    private let router      = MovieListRouter()
    
    //Other Variables
    private var tableViewHandler: TableViewManager<MovieListCell, Movie>?
    var currentCategory = MovieCategoryViewModel()
    
    private var categoryTitle: String {
        let key = currentCategory.keys.first ?? ""
        return key
    }
    private var movies: [Movie] {
        guard let key = currentCategory.keys.first, let movieArray = currentCategory[key] else {
            return [Movie]()
        }
        return movieArray
    }
    
    //@IBoutlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        title = categoryTitle
    }
    
    override func setupCleanStack() {
        router.controller = self
    }
    

    
    private func setupTableView() {
        let identifier = MovieListCell.identifier()
        self.tableViewHandler = TableViewManager<MovieListCell, Movie>(identifier, self.movies, cellConfigurationBlock: { (cell, movie) in
            var title = movie.title
            if movie.title != movie.originalTitle {
                title += "\n(\(movie.originalTitle))"
            }
            cell.title.text = title
            cell.background.image(withPath: movie.backdropPath)
        }, cellSelectorHandler: { movie in
            self.router.navigateToMovieDetail(withMovie: movie)
        })
        self.tableView.dataSource = tableViewHandler
        self.tableView.delegate = tableViewHandler
    }
}
