//
//  MenuViewController.swift
//  SpicyChicken
//
//  Created by 朱坤 on 3/12/16.
//  Copyright © 2016 Zkuns. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
  @IBOutlet weak var menuTable: UITableView!
  
}

extension MenuViewController: UITableViewDelegate{
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return MenuItem.MenuItems.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    return MenuCell()
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
}

extension MenuViewController: UITableViewDataSource{
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
  }
}