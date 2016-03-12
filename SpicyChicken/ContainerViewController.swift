//
//  ContainerViewController.swift
//  SpicyChicken
//
//  Created by 朱坤 on 3/10/16.
//  Copyright © 2016 Zkuns. All rights reserved.
//

import UIKit

enum State{
  case Open
  case Close
}

protocol ChangeSubControllerDelegate{
  func change(controllerName: String)
}


class ContainerViewController: UIViewController {
  
  var subviewsNavigationController = UINavigationController()
  var currentStatus: State = .Close
  var currentMenuItem: MenuItem?
  var animateDistance: CGFloat = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    
    animateDistance = view.frame.width * 0.25
    
    //add navigationController
    addChildViewController(subviewsNavigationController)
    view.addSubview(subviewsNavigationController.view)
    subviewsNavigationController.didMoveToParentViewController(self)
    subviewsNavigationController.navigationBar.hidden = true
    
    //add menuViewController
    let menuViewController = MenuViewController()
    addChildViewController(menuViewController)
    view.addSubview(menuViewController.view)
    menuViewController.didMoveToParentViewController(self)
    
    //add activityController
//    currentMenuItem = MenuItem.MenuItems.first
//    guard let controller = storyboard?.instantiateViewControllerWithIdentifier((currentMenuItem?.controllerName)!) else { return }
//    subviewsNavigationController.pushViewController(controller, animated: false)
    
    //add animate gesture
    let panGesture = UIPanGestureRecognizer(target: self, action:"handlePanGesture:")
    self.view.addGestureRecognizer(panGesture)
  }
  
  func toggleMenuView(){
    switch currentStatus{
    case .Open:
      closeMenuView()
    case .Close:
      openMenuView()
    }
  }
  
  private func closeMenuView(){
    UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
      self.subviewsNavigationController.view.center.x -= self.animateDistance
      }, completion: { _ in
      self.currentStatus = .Close
    })
  }
  
  private func openMenuView(){
    UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
      self.subviewsNavigationController.view.center.x += self.animateDistance
      }, completion: { _ in
      self.currentStatus = .Open
    })
  }

}

extension ContainerViewController: ChangeSubControllerDelegate{
  func change(controllerName: String) {
    
  }
}

extension ContainerViewController: UIGestureRecognizerDelegate{
  func handlePanGesture(sender: UIPanGestureRecognizer){
    let x = sender.translationInView(view).x
    switch sender.state {
    case .Ended:
      if abs(x) > 100 {
        toggleMenuView()
      }
    default: break;
    }
  }
}
