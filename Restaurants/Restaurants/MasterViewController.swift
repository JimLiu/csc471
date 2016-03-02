//
//  MasterViewController.swift
//  Restaurants
//
//  Created by Jim Liu on 2/29/16.
//  Copyright © 2016 Jim Liu. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    let restaurants = DataSource.loadRestaurants()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Restaurants in Chicago"
        
        self.tableView.rowHeight = 128
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let restaurant = restaurants[indexPath.row]
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.restaurant = restaurant
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RestaurantTableViewCell", forIndexPath: indexPath) as! RestaurantTableViewCell

        let restaurant = restaurants[indexPath.row]
        cell.previewImage.setImageWithUrl(restaurant.imageUrl, contentMode: UIViewContentMode.ScaleAspectFill)
        
        cell.previewImage.layer.cornerRadius = 4.0
        cell.previewImage.layer.masksToBounds = true
        
        cell.nameLabel.text = "#\(indexPath.row + 1). \(restaurant.name)"
        cell.ratingView.rating = restaurant.rating
        cell.ratingView.text = "\(restaurant.rating)"
        cell.ratingView.updateOnTouch = false
        cell.addressLabel.text = restaurant.address
        
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
}

