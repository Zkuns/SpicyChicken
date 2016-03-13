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
      print(self.menuViewController.view.frame)
    })
  }

}

extension ContainerViewController: ChangeSubControllerDelegate{
  func change(controllerName: String) {
    let controller = (storyboard?.instantiateViewControllerWithIdentifier(controllerName))!
    subviewsNavigationController.addChildViewController(controller)
    subviewsNavigationController.view.addSubview(controller.view)
    controller.didMoveToParentViewController(subviewsNavigationController)
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
