//
//  ActivityCell.swift
//  SpicyChicken
//
//  Created by 朱坤 on 3/10/16.
//  Copyright © 2016 Zkuns. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftyJSON

class ActivityCell: UITableViewCell {
  var activity: Activity?{
    didSet{
      title.text = activity?["title"] as? String
      let cover_url = activity?["cover_url"] as? String
      let nsurl = NSURL(string: (cover_url ?? ""))
      coverImage.kf_setImageWithURL(nsurl!, placeholderImage: UIImage(named: "testActivity"))
    }
  }
  
  @IBOutlet weak var coverImage: UIImageView!
  @IBOutlet weak var title: UILabel!
  
}
