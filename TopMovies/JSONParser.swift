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
        
        if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSDictionary {
            if let feed = json["feed"] as? NSDictionary {
                if let entries = feed["entry"] as? NSArray {
                    for entry in entries {
                        if let name = entry["im:name"] as? NSDictionary {
                            if let label = name["label"] as? String {
                                titles.append(label)
                            }
                        }
                    }
                }
            }
        } else {
            if let unwrappedError = jsonError {
                println("json error: \(unwrappedError)")
            }
        }
        
        return titles
    }
    
    func badTitlesFromJSON(data: NSData) -> [String] {
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