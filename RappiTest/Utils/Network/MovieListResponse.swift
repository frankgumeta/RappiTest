//
//  MovieListResponse.swift
//  RappiTest
//
//  Created by Francisco Eduardo Toledo Gumeta on 8/12/19.
//  Copyright © 2019 Frank Gumeta. All rights reserved.
//

import Foundation

struct MovieListResponse: Codable {
    let results: [Movie]?
}
