//
//  MenuCeill.swift
//  SpicyChicken
//
//  Created by 朱坤 on 3/12/16.
//  Copyright © 2016 Zkuns. All rights reserved.
//

import UIKit
import Kingfisher

class MenuCell: UITableViewCell {
  @IBOutlet weak var menuTitle: UILabel!
  @IBOutlet weak var menuImage: UIImageView!
  
  func setData(menuItem: MenuItem){
    menuTitle.text = menuItem.title
    menuImage.kf_setImageWithURL(NSURL(string: menuItem.imageName ?? "")!, placeholderImage: UIImage(named: "1.pic"))
  }
}
