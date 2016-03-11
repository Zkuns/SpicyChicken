//
//  JsonParse.swift
//  SpicyChicken
//
//  Created by 朱坤 on 3/10/16.
//  Copyright © 2016 Zkuns. All rights reserved.
//

import Foundation
import SwiftyJSON


struct JsonParse {
  
  static func parseActivity(data: NSData?) -> [Activity]{
    let activitiesData = JSON(data: data!)["activities"].array
    let activities = activitiesData!.map{ activity -> Activity in
      return Activity(id: activity["id"].string, title: activity["title"].string, description: activity["description"].string, introduction: activity["introduction"].string, timestamp_start_at: activity["timestamp_start_at"].string, timestamp_end_at: activity["timestamp_end_at"].string, timestamp_apply_start_at: activity["timestamp_apply_start_at"].string, timestamp_apply_end_at: activity["timestamp_apply_end_at"].string, status: activity["status"].string, cover_url: activity["cover_url"].string)
    }
    return activities
  }
  
}