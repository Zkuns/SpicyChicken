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
  func change(controllerName: String, up: Bool)
}


class ContainerViewController: UIViewController {
  
  var subviewsNavigationController = UINavigationController()
  var menuViewController: MenuViewController!
  var currentStatus: State = .Close
  var currentMenuItem: MenuItem?
  var animateDistance: CGFloat!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    animateDistance = view.frame.width * 0.25
    
    //add navigationController
    addChildViewController(subviewsNavigationController)
    view.addSubview(subviewsNavigationController.view)
    subviewsNavigationController.didMoveToParentViewController(self)
    subviewsNavigationController.navigationBar.hidden = true
    
    //add menuViewController
    menuViewController = storyboard?.instantiateViewControllerWithIdentifier("MenuViewController") as? MenuViewController
    menuViewController.changeControllerDelegate = self
    addChildViewController(menuViewController)
    view.addSubview(menuViewController.view)
    menuViewController.didMoveToParentViewController(self)
    menuViewController.view.center.x -= view.frame.width
    
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
      self.menuViewController.view.center.x -= self.animateDistance
      }, completion: { _ in
      self.currentStatus = .Close
    })
  }
  
  private func openMenuView(){
    UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
      self.subviewsNavigationController.view.center.x += self.animateDistance
      self.menuViewController.view.center.x += self.animateDistance
      }, completion: { _ in
      self.currentStatus = .Open
    })
  }

}

extension ContainerViewController: ChangeSubControllerDelegate{
  func change(controllerName: String, up: Bool) {
    let addController = (storyboard?.instantiateViewControllerWithIdentifier(controllerName))!
    let removeController = subviewsNavigationController.topViewController
    if let removeController = removeController {
      subviewsNavigationController.addChildViewController(addController)
      subviewsNavigationController.view.addSubview(addController.view)
      addController.didMoveToParentViewController(subviewsNavigationController)
      moveAnimate(addController, removeController: removeController, up: up, duration: 1, voffset: 100)
    } else {
      subviewsNavigationController.viewControllers = [addController]
    }
  }
  
  func moveAnimate(addController: UIViewController, removeController: UIViewController, up: Bool, duration: Double, voffset: CGFloat) {
    let hoffset = view.frame.height
    addController.view.center.x += voffset
    addController.view.center.y += up ? hoffset : -hoffset
    UIView.animateKeyframesWithDuration(duration, delay: 0, options: [], animations: {
      UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0.2, animations: {
        removeController.view.center.x += voffset
      })
      UIView.addKeyframeWithRelativeStartTime(0.21, relativeDuration: 0.6, animations: {
        removeController.view.center.y += up ? -hoffset : hoffset
      })
      UIView.addKeyframeWithRelativeStartTime(0.21, relativeDuration: 0.6, animations: {
        addController.view.center.y += up ? -hoffset : hoffset
      })
      UIView.addKeyframeWithRelativeStartTime(0.82, relativeDuration: 0.09, animations: {
        addController.view.center.x -= voffset
      })
      UIView.addKeyframeWithRelativeStartTime(0.91, relativeDuration: 0.09 , animations: {
        self.subviewsNavigationController.view.center.x -= self.animateDistance
        self.menuViewController.view.center.x -= self.animateDistance
      })
    }, completion: {_ in
      self.currentStatus = .Close
    })
  }
  
}

extension ContainerViewController: UIGestureRecognizerDelegate{
  func handlePanGesture(sender: UIPanGestureRecognizer){
    let x = sender.translationInView(view).x
    switch sender.state {
    case .Ended:
      guard abs(x) > 50 else { return }
      if currentStatus == .Open && x < 0 { toggleMenuView() }
      if currentStatus == .Close && x > 0 { toggleMenuView() }
    default: break;
    }
  }
}
