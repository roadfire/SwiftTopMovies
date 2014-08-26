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
    
    lazy var filePath: String = {
        let bundle = NSBundle(forClass: JSONParserTests.self)
        let path = bundle.pathForResource("topmovies", ofType: "json")
        return path!
    }()
    
    let parser = JSONParser()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        var error: NSError?
        let json = NSData.dataWithContentsOfFile(filePath, options: nil, error: &error)
        let titles = parser.titlesFromJSON(json)
        XCTAssert(titles.count == 10)
        
        XCTAssert(titles[0] == "Godzilla (2014)")
    }
        
}
