//
//  MovieListCell.swift
//  RappiTest
//
//  Created by Francisco Eduardo Toledo Gumeta on 8/12/19.
//  Copyright © 2019 Frank Gumeta. All rights reserved.
//

import UIKit

class MovieListCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var background: UIImageView!
    
    class func identifier() -> String {
        let identifier = String(describing: MovieListCell.self)
        return identifier
    }
}
