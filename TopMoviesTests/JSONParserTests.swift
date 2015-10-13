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
        
        do {
            let json = try NSData(contentsOfFile:filePath, options: [])
            let titles = parser.titlesFromJSON(json)
            
            XCTAssert(titles.count == 10)
            XCTAssert(titles[0] == "Godzilla (2014)")
        } catch {
            XCTFail("could not read JSON from file: \(filePath)")
        }
    }
    
    func testParseEmptyJSON() {
        let filePath = NSBundle(forClass: JSONParserTests.self).pathForResource("topmovies-empty", ofType: "json")!

        do {
            let json = try NSData(contentsOfFile:filePath, options: [])
            let titles = parser.titlesFromJSON(json)
            XCTAssert(titles.count == 0)
        } catch {
            XCTFail("could not read JSON from file: \(filePath)")
        }
    }
    
    func testParseEmptyFeed() {
        let filePath = NSBundle(forClass: JSONParserTests.self).pathForResource("topmovies-empty-feed", ofType: "json")!
        
        do {
            let json = try NSData(contentsOfFile:filePath, options: [])
            let titles = parser.titlesFromJSON(json)
            XCTAssert(titles.count == 0)
        } catch {
            XCTFail("could not read JSON from file: \(filePath)")
        }
    }
}
