//
//  Activity.swift
//  SpicyChicken
//
//  Created by 朱坤 on 3/10/16.
//  Copyright © 2016 Zkuns. All rights reserved.
//

import Foundation

class Activity: BaseModel{
  static var attrs = ["id", "title"]
  static var modelName = "activities"
  static var allData = [Activity]()
  
  static func findAll(callback: ([Activity])->()){
    all(self.attrs, sourceUrl: Config.ResourceUrl.ActivityUrl, modelName: self.modelName){ data in
      let activities = data.map{ data in
        Activity(dataSource: data)
      }
      callback(activities)
    }
  }
  
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
//  
//  init(id: String?, title: String?, description: String?, introduction: String?, timestamp_start_at: String?, timestamp_end_at: String?, timestamp_apply_start_at: String?, timestamp_apply_end_at: String?, status: String?, cover_url: String?){
//    self.id = id
//    self.title = title
//    self.description = description
//    self.introduction = introduction
//    self.timestamp_start_at = timestamp_start_at
//    self.timestamp_end_at = timestamp_end_at
//    self.timestamp_apply_start_at = timestamp_apply_start_at
//    self.timestamp_apply_end_at = timestamp_apply_end_at
//    self.status = status
//    self.cover_url = cover_url
//  }
//  
}
