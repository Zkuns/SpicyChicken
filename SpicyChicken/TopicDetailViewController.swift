//
//  TopicDetailViewController.swift
//  SpicyChicken
//
//  Created by 朱坤 on 3/13/16.
//  Copyright © 2016 Zkuns. All rights reserved.
//

import UIKit

class TopicDetailViewController: UIViewController {
  var topic: Topic?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let panGesture = UIPanGestureRecognizer(target: self, action: "handlePanGesture:")
    view.addGestureRecognizer(panGesture)
  }
  
  func setData(topic: Topic){
    self.topic = topic
  }
  
}

extension TopicDetailViewController: UIGestureRecognizerDelegate{
  func handlePanGesture(sender: UIPanGestureRecognizer){
    let x = sender.translationInView(view).x
    switch sender.state{
    case .Ended:
      if (x > 50){ self.navigationController?.popViewControllerAnimated(true) }
    default: break
    }
  }

}
