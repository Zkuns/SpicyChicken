//
//  menuItem.swift
//  SpicyChicken
//
//  Created by 朱坤 on 3/11/16.
//  Copyright © 2016 Zkuns. All rights reserved.
//

import Foundation

struct MenuItem: Equatable{
  var controllerName: String?
  var imageName: String?
  var title: String?
  
  static let MenuItems = [MenuItem(controllerName: "ActivitiesViewController", imageName: "", title: "活动")]
  
  init(controllerName: String, imageName: String, title: String){
    self.controllerName = controllerName
    self.imageName = imageName
  }
  
}

func ==(lhs: MenuItem, rhs: MenuItem) -> Bool{
  return lhs.controllerName == rhs.controllerName
}
