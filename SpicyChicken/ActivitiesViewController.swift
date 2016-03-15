//
//  ActivitiesViewController.swift
//  SpicyChicken
//
//  Created by 朱坤 on 3/10/16.
//  Copyright © 2016 Zkuns. All rights reserved.
//

import UIKit
import Alamofire

class ActivitiesViewController: UIViewController {

  @IBOutlet weak var activitiesTable: UITableView!
  
  var activities = [Activity](){
    didSet{
      activitiesTable.reloadData()
    }
  }
  
  private func getDate(){
    Activity.findAll(Config.ResourceUrl.ActivityUrl, modelName: "activities"){ (data: [Activity]) -> () in
      self.activities = data
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getDate()
    
    activitiesTable.rowHeight = UITableViewAutomaticDimension
    activitiesTable.estimatedRowHeight = 160.0
  }

}

extension ActivitiesViewController: UITableViewDelegate{
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let controller = storyboard?.instantiateViewControllerWithIdentifier("ActivityDetailViewController") as! ActivityDetailViewController
    controller.setData(activities[indexPath.row])
    self.navigationController?.pushViewController(controller, animated: true)
  }
}

extension ActivitiesViewController: UITableViewDataSource{
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("activityCell", forIndexPath: indexPath) as! ActivityCell
    cell.activity = activities[indexPath.row]
    return cell
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return activities.count
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
}