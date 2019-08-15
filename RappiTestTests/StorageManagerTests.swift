//
//  RappiTestTests.swift
//  RappiTestTests
//
//  Created by Francisco Eduardo Toledo Gumeta on 8/12/19.
//  Copyright © 2019 Frank Gumeta. All rights reserved.
//

import XCTest
@testable import RappiTest

class RappiTestTests: XCTestCase {
    func testStorage() {
        let fileName = "testData.data"
        let movieTitle = "Movie Title"
        let movieOriginalTitle = "Original Movie Title"
        let movieOverview = "Movie Overview"
        
        let movie = Movie(voteCount: 10,
                          id: 0,
                          video: false,
                          voteAverage: 10.0,
                          title: movieTitle,
                          popularity: 10.0,
                          posterPath: "/oewirutpoqiew.jpg",
                          originalLanguage: "es",
                          originalTitle: movieOriginalTitle,
                          genres: [0,1,2], backdropPath: "/iweutrpquoe.jpg",
                          adult: false,
                          overview: movieOverview,
                          releaseDate: "2019/12/12")
        /// **** ENTITY STORAGE ****
        ///Testing initial value
        var entity = StorageManager.fetchEntity(fileName, as: Movie.self)
        XCTAssertNil(entity, "Entity should BE nil")
        ///Testing save
        StorageManager.saveEntity(movie, as: fileName)
        entity = StorageManager.fetchEntity(fileName, as: Movie.self)
        XCTAssertNotNil(entity, "Entity should NOT BE nil")
        XCTAssert(movie.title == movieTitle, "Title doesn´t match")
        XCTAssert(movie.originalTitle == movieOriginalTitle, "Original Title doesn´t match")
        XCTAssert(movie.overview == movieOverview, "Overview doesn´t match")
        ///Testing delete
        StorageManager.deleteEntity(fileName: fileName)
        entity = StorageManager.fetchEntity(fileName, as: Movie.self)
        XCTAssertNil(entity, "Entity should BE nil")
        
        /// **** IMAGE STORAGE ****
        let exampleURL = "exampleKey "
        let exampleImage = #imageLiteral(resourceName: "starIcon")
        ///Testing initial value
        var image = StorageManager.fetchImage(fromURL: exampleURL)
        XCTAssertNil(image, "Image should BE nil")
        
        StorageManager.saveImage(exampleImage, withKey: exampleURL)
        image = StorageManager.fetchImage(fromURL: exampleURL)
        XCTAssertNotNil(image, "Image should NOT BE nil")
        
        StorageManager.deleteImage(url: exampleURL)
        image = StorageManager.fetchImage(fromURL: exampleURL)
        XCTAssertNil(image, "Image should BE nil")
    }

}
