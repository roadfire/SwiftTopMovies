//
//  TopMoviesTests.swift
//  TopMoviesTests
//
//  Created by Josh Brown on 8/8/14.
//  Copyright (c) 2014 Roadfire Software. All rights reserved.
//

import XCTest
import TopMovies

class JSONParserTests: XCTestCase {
    
    let parser = JSONParser()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testParseExpectedJSON() {
        let filePath = NSBundle(forClass: JSONParserTests.self).pathForResource("topmovies", ofType: "json")!
        
        var error: NSError?
        let json = NSData.dataWithContentsOfFile(filePath, options: nil, error: &error)
        let titles = parser.titlesFromJSON(json)
        XCTAssert(titles.count == 10)
        
        XCTAssert(titles[0] == "Godzilla (2014)")
    }
    
    func testParseEmptyJSON() {
        let filePath = NSBundle(forClass: JSONParserTests.self).pathForResource("topmovies-empty", ofType: "json")!
        var error: NSError?
        let json = NSData.dataWithContentsOfFile(filePath, options: nil, error: &error)
        let titles = parser.titlesFromJSON(json)
        XCTAssert(titles.count == 0)
        
        let badTitles = parser.badTitlesFromJSON(json)
        XCTAssert(badTitles.count == 0)
    }
    
    func testParseEmptyFeed() {
        let filePath = NSBundle(forClass: JSONParserTests.self).pathForResource("topmovies-empty-feed", ofType: "json")!
        var error: NSError?
        let json = NSData.dataWithContentsOfFile(filePath, options: nil, error: &error)
        let titles = parser.titlesFromJSON(json)
        XCTAssert(titles.count == 0)

        let badTitles = parser.badTitlesFromJSON(json)
        XCTAssert(badTitles.count == 0)
    }
}
