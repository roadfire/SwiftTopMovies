//
//  ViewModel.swift
//  TopMovies
//
//  Created by Josh Brown on 8/8/14.
//  Copyright (c) 2014 Roadfire Software. All rights reserved.
//

import Foundation

class ViewModel {
    
    let titles: [String]
    
    init(getSourceData: () -> (titles: [String])) {
        self.titles = getSourceData()
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