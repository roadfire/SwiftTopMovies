//
//  JSONParser.swift
//  TopMovies
//
//  Created by Josh Brown on 8/26/14.
//  Copyright (c) 2014 Roadfire Software. All rights reserved.
//

import Foundation

class JSONParser {
    func titlesFromJSON(data: NSData) -> [String] {
        var titles = [String]()
        var jsonError: NSError?
        let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as NSDictionary
        
        if let unwrappedError = jsonError {
            println("json error: \(unwrappedError)")
        } else {
            titles = json.valueForKeyPath("feed.entry.im:name.label") as [String]
        }
        return titles
    }
}