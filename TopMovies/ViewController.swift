//
//  ViewController.swift
//  TopMovies
//
//  Created by Josh Brown on 8/8/14.
//  Copyright (c) 2014 Roadfire Software. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let viewModel = ViewModel()
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchTitles {
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfItemsInSection(section)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        configureCell(cell, forRowAtIndexPath:indexPath)
        return cell
    }

    func configureCell(cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.textLabel!.text = self.viewModel.titleForItemAtIndexPath(indexPath)
    }
}

