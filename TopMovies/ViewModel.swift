//
//  ViewModel.swift
//  TopMovies
//
//  Created by Josh Brown on 8/8/14.
//  Copyright (c) 2014 Roadfire Software. All rights reserved.
//

import Foundation

class ViewModel {
    let urlString = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
    var titles = [String]()

    func fetchTitles(success:() -> ()) {
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let url = NSURL(string: urlString)
        let task = session.dataTaskWithURL(url) { (data, response, error) -> Void in
                var error: NSError?
                let json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: &error) as NSDictionary
                
                self.titles = json.valueForKeyPath("feed.entry.im:name.label") as [String]
                
                success()

            }
        task.resume()
    }

    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return titles.count
    }

    func titleForItemAtIndexPath(indexPath: NSIndexPath) -> String {
        return titles[indexPath.row]
    }
}