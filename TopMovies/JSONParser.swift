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
        
        do {
            if let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String: AnyObject],
                let feed = json["feed"] as? [String: AnyObject],
                entries = feed["entry"] as? [[String: AnyObject]] {
                    
                    for entry in entries {
                        if let name = entry["im:name"] as? [String: AnyObject],
                            label = name["label"] as? String {
                                titles.append(label)
                        }
                    }
            }
        } catch {
            print("error parsing JSON: \(error)")
        }
        
        return titles
    }
}