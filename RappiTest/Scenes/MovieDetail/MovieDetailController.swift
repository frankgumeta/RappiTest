//
//  MovieDetailController.swift
//  RappiTest
//
//  Created by Francisco Eduardo Toledo Gumeta on 8/12/19.
//  Copyright © 2019 Frank Gumeta. All rights reserved.
//

import UIKit

class MovieDetailController: BaseController {
    //Clean Arch Stack
    private var router = MovieDetailRouter()
    
    //@IBOutlets
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var watchTrailerButton: UIButton!
    
    //Other Variables
    var currentMovie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func setupCleanStack() {
        router.controller = self
    }
    
    private func setupUI() {
        guard let movie = currentMovie else {
            fatalError("Movie parameter is empty")
        }
        movieTitle.text = movie.title
        movieRating.text = String(format: "%.1f/10", movie.voteAverage)
        movieReleaseDate.text = movie.releaseDate
        movieDescription.text = movie.overview
        backgroundImage.image(withPath: movie.posterPath)
        
        watchTrailerButton.isHidden = movie.video == false
    }
    
    @IBAction func dismiss() {
        router.dismiss()
    }

}
