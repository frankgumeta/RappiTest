//
//  MovieDetailRouter.swift
//  RappiTest
//
//  Created by Francisco Eduardo Toledo Gumeta on 8/12/19.
//  Copyright © 2019 Frank Gumeta. All rights reserved.
//

import UIKit

protocol MovieDetailRouterLogic {
    func dismiss()
}

class MovieDetailRouter {
    weak var controller: MovieDetailController?
}

extension MovieDetailRouter: MovieDetailRouterLogic {
    func dismiss() {
        controller?.dismiss(animated: true, completion: nil)
    }
}
