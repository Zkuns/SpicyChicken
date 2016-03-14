//
//  Topic.swift
//  SpicyChicken
//
//  Created by 朱坤 on 3/13/16.
//  Copyright © 2016 Zkuns. All rights reserved.
//

import Foundation

class Topic: BaseModel{
  static var modelName = "topics"
  static var allData = [Activity]()
  
  static func findAll(callback: ([Topic])->()){
    all(Config.ResourceUrl.TopicUrl, modelName: self.modelName){ data in
      let topics = data.map{ data in
        Topic(dataSource: data)
      }
      callback(topics)
    }
  }
  
}