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
      guard let item = menuItem else { return }
      if(item != menuItem!){
        menuItem = item
        changeControllerDelegate?.change(menuItem?.controllerName ?? "")
      }
    }
    get{
      return menuItem
    }
  }
  
  override func viewDidLoad() {
    currentMenuItem = MenuItem.MenuItems.first
  }
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
    menuItem = MenuViewController.menuItems[indexPath.row]
  }
}