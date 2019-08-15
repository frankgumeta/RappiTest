//
//  MovieCategoriesController.swift
//  RappiTest
//
//  Created by Francisco Eduardo Toledo Gumeta on 8/12/19.
//  Copyright © 2019 Frank Gumeta. All rights reserved.
//

import UIKit

protocol MovieCategoriesControllerLogic {
    func displayData(categories: MovieCatalogViewModel)
}

class MovieCategoriesController: BaseController {
    //Clean Arch Stack
    private let interactor  = MovieCategoriesInteractor()
    private let router      = MovieCategoriesRouter()
    
    //Other variables
    private var currentCategories = MovieCatalogViewModel()
    private var tableViewHandler: TableViewManager<MovieCategoryCell, MovieCategoryViewModel>?
    
    //@IBoutlets
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.loadData()
    }
    
    override func setupCleanStack() {
        let presenter = MovieCategoriesPresenter()
        presenter.controller = self
        interactor.presenter = presenter
        
        router.controller = self
    }
    
    private func setupTableView() {
        let identifier = MovieCategoryCell.identifier()
        
        self.tableViewHandler = TableViewManager<MovieCategoryCell, MovieCategoryViewModel>(identifier, currentCategories, cellConfigurationBlock: { cell, category in
            let title = category.first?.key ?? "Unknown"
            cell.title.text = title
        }, cellSelectorHandler: { category in
            self.router.navigateToMovieList(with: category)
        })

        DispatchQueue.main.async {
            self.tableView.dataSource = self.tableViewHandler
            self.tableView.delegate = self.tableViewHandler
            self.tableView.reloadData()
        }
    }
}

extension MovieCategoriesController: MovieCategoriesControllerLogic {
    func displayData(categories: MovieCatalogViewModel) {
        self.currentCategories = categories
        self.setupTableView()
    }
}
