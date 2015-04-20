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
        
        if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? [String: AnyObject],
            feed = json["feed"] as? [String: AnyObject],
            entries = feed["entry"] as? [[String: AnyObject]]
        {
            for entry in entries {
                if let name = entry["im:name"] as? [String: AnyObject],
                    label = name["label"] as? String {
                        titles.append(label)
                }
            }
        } else {
            if let jsonError = jsonError {
                println("json error: \(jsonError)")
            }
        }
        
        return titles
    }
}