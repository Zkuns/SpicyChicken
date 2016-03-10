//
//  ActivitiesViewController.swift
//  SpicyChicken
//
//  Created by 朱坤 on 3/10/16.
//  Copyright © 2016 Zkuns. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {

  @IBOutlet weak var activitiesTable: UITableView!
  
  var activities = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

}

extension ActivitiesViewController: UITableViewDelegate{
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let cell = tableView.dequeueReusableCellWithIdentifier("activityCell", forIndexPath: indexPath) as ActivityCell
    cell.activity = activities[indexPath.section][indexPath.row]
    return cell
  }
}

extension ActivitiesViewController: UITableViewDataSource{
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return activities[section].count
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return activities.count
  }
  
}