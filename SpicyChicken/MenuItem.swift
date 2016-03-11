//
//  menuItem.swift
//  SpicyChicken
//
//  Created by 朱坤 on 3/11/16.
//  Copyright © 2016 Zkuns. All rights reserved.
//

import Foundation

struct MenuItem{
  var controllerName: String?
  var imageName: String?
  
  static let MenuItems = [MenuItem(controllerName: "ActivitiesViewController", imageName: "")]
  
  init(controllerName: String, imageName: String){
    self.controllerName = controllerName
    self.imageName = imageName
  }
  
}