//
//  MenuViewController.swift
//  SpicyChicken
//
//  Created by 朱坤 on 3/12/16.
//  Copyright © 2016 Zkuns. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
  static let menuItems: [MenuItem] = [MenuItem(controllerName: "ActivitiesViewController", imageName: "", title: "活动"), MenuItem(controllerName: "TopicsViewController", imageName: "", title: "文章")]
  
  @IBOutlet weak var menuTable: UITableView!
  var changeControllerDelegate: ChangeSubControllerDelegate?
  var menuItem: MenuItem?
  var currentMenuItem: MenuItem?{
    set{
      guard (menuItem == nil || menuItem! != newValue!) else { return }
      var up: Bool = true
      if let menuItem = menuItem{ up = MenuViewController.menuItems.indexOf(menuItem) < MenuViewController.menuItems.indexOf(newValue!) }
      menuItem = newValue
      changeControllerDelegate?.change(menuItem?.controllerName ?? "", up: up)
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
    currentMenuItem = MenuViewController.menuItems[indexPath.row]
  }
}