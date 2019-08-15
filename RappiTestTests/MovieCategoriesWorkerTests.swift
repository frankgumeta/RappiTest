//
//  MovieCategoriesWorkerTests.swift
//  RappiTestTests
//
//  Created by Francisco Eduardo Toledo Gumeta on 8/14/19.
//  Copyright © 2019 Frank Gumeta. All rights reserved.
//

import XCTest
@testable import RappiTest

class MovieCategoriesWorkerTests: XCTestCase {

    func testFetchCategories() {
        let categoriesExpectation = expectation(description: "Retrieve movie catalog")
        MovieCategoriesWorker.loadCategories(completion: { catalog in
            XCTAssertNotNil(catalog, "Movie Catalog SHOULD NOT BE nil")
            categoriesExpectation.fulfill()
        })
        
        wait(for: [categoriesExpectation], timeout: 5.0)
    }

    func testPerformanceExample() {
        //Not setting baseline since internet connection may vary
        self.measure {
            testFetchCategories()
        }
    }

}
