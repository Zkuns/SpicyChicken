//
//  TopicViewController.swift
//  SpicyChicken
//
//  Created by 朱坤 on 3/13/16.
//  Copyright © 2016 Zkuns. All rights reserved.
//

import UIKit

class TopicsViewController: UIViewController {
  
  @IBOutlet weak var topicsTable: UITableView!
  
  var topics = [Topic]() {
    didSet{
      topicsTable.reloadData()
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
//    Topic.findAll({ topics in
//      self.topics = topics
//    })
  }

}

extension TopicsViewController: UITableViewDelegate{
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let controller = storyboard?.instantiateViewControllerWithIdentifier("TopicDetailViewController") as! TopicDetailViewController
    controller.setData(topics[indexPath.row])
    self.navigationController?.pushViewController(controller, animated: true)
  }
}

extension TopicsViewController: UITableViewDataSource{
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return topics.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("TopicCell") as! TopicCell
    cell.topic = topics[indexPath.row]
    return cell
  }
  
}
