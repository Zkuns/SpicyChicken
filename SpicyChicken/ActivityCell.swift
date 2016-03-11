//
//  ActivityCell.swift
//  SpicyChicken
//
//  Created by 朱坤 on 3/10/16.
//  Copyright © 2016 Zkuns. All rights reserved.
//

import UIKit
import Kingfisher

class ActivityCell: UITableViewCell {
  var activity: Activity?{
    didSet{
      title.text = activity?.title
      coverImage.kf_setImageWithURL(NSURL(string: activity?.cover_url ?? "")!, placeholderImage: UIImage(named: "testActivity"))
    }
  }
  
  @IBOutlet weak var coverImage: UIImageView!
  @IBOutlet weak var title: UILabel!
  
}
