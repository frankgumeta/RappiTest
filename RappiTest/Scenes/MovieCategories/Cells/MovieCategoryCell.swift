//
//  MovieCategoryCell.swift
//  RappiTest
//
//  Created by Francisco Eduardo Toledo Gumeta on 8/12/19.
//  Copyright © 2019 Frank Gumeta. All rights reserved.
//

import UIKit

class MovieCategoryCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    
    class func identifier() -> String {
        let identifier = String(describing: MovieCategoryCell.self)
        return identifier
    }
}
