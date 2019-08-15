//
//  GlobalProtocols.swift
//  RappiTest
//
//  Created by Francisco Eduardo Toledo Gumeta on 8/12/19.
//  Copyright © 2019 Frank Gumeta. All rights reserved.
//

import Foundation

protocol CleanArchCompliant {
    func setupCleanStack()
}

protocol Identifiable {
    func identifier() -> String
}
