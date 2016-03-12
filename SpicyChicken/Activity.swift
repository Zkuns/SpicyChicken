//
//  Activity.swift
//  SpicyChicken
//
//  Created by 朱坤 on 3/10/16.
//  Copyright © 2016 Zkuns. All rights reserved.
//

import Foundation

//  var id: String?
//  var title: String?
//  var description: String?
//  var introduction: String?
//  var timestamp_start_at: String?
//  var timestamp_end_at: String?
//  var timestamp_apply_start_at: String?
//  var timestamp_apply_end_at: String?
//  var status: String?
//  var cover_url: String?
//  var location: Location?

class Activity: BaseModel{
  static var modelName = "activities"
  static var allData = [Activity]()
  
  static func findAll(callback: ([Activity])->()){
    all(Config.ResourceUrl.ActivityUrl, modelName: self.modelName){ data in
      let activities = data.map{ data in
        Activity(dataSource: data)
      }
      callback(activities)
    }
  }
  
}
