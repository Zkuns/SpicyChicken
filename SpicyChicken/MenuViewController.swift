//
//  MenuViewController.swift
//  SpicyChicken
//
//  Created by 朱坤 on 3/12/16.
//  Copyright © 2016 Zkuns. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
  static let menuItems: [MenuItem] = [MenuItem(controllerName: "ActivitiesViewController", imageName: "", title: "活动")]
  
  @IBOutlet weak var menuTable: UITableView!
  var changeControllerDelegate: ChangeSubControllerDelegate?
  var menuItem: MenuItem?
  var currentMenuItem: MenuItem?{
    set{
      if menuItem == nil || menuItem! != newValue!{
        menuItem = newValue
        changeControllerDelegate?.change(menuItem?.controllerName ?? "")
      }
    }
    get{
      return menuItem
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    currentMenuItem = MenuViewController.menuItems.first
  }
}

extension MenuViewController: UITableViewDelegate{
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return MenuViewController.menuItems.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell") as! MenuCell
    cell.setData(MenuViewController.menuItems[indexPath.row])
    return cell
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
}

extension MenuViewController: UITableViewDataSource{
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    menuItem = MenuViewController.menuItems[indexPath.row]
  }
}