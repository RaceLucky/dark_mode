//
//  TabBarController.swift
//
//

import UIKit

class TabBarController: UITabBarController {
  
  // MARK:- Private Properties
  
  private var tabWidth: CGFloat {
    tabBar.frame.size.width / 4
  }
  
  // MARK:- LifeCycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initialSetup()
    setupStyle()
  }
  
  // MARK:- Private
  
  private func initialSetup() {
    self.delegate = self
    configureTabBar()
    addInitialControllers()
    bind()
  }
  
  private func configureTabBar() {
    tabBar.shadowImage = UIImage()
    tabBar.backgroundImage = UIImage()
    setupStyle()
  }
  
  private func setupStyle() {
    tabBar.tintColor = UIColor(named: "Label_Color")
    tabBar.unselectedItemTintColor = UIColor(named: "Label_Color")
  }
  
  private func addInitialControllers() {
    let homeVC = StoryboardScene.Main.instantiateViewController(withClass: ViewController.self)
    let homeNavigationController = navigationController(rootViewController: homeVC)
    
    let myContactsVC  = StoryboardScene.Main.instantiateViewController(withClass: ViewController.self)
    let myContactsNavigationController = navigationController(rootViewController: myContactsVC)
    
    let  shareVC = StoryboardScene.Main.instantiateViewController(withClass: ViewController.self)
    let shareNavigationController = navigationController(rootViewController: shareVC)
    
    let settingsVC = StoryboardScene.Main.instantiateViewController(withClass: ViewController.self)
    let settingsNavigationController = navigationController(rootViewController: settingsVC)
    
    viewControllers = [
      homeNavigationController,
      shareNavigationController,
      myContactsNavigationController,
      settingsNavigationController
    ]
    
    homeNavigationController.tabBarItem = UITabBarItem(
      title: "Home",
      image: UIImage(named: "ic_home"),
      selectedImage: nil
    )
    
    shareNavigationController.tabBarItem = UITabBarItem(
      title: "Shop",
      image: UIImage(named: "ic_shop"),
      selectedImage: nil
    )
    
    myContactsNavigationController.tabBarItem = UITabBarItem(
      title: "Help",
      image: UIImage(named: "ic_help"),
      selectedImage: nil
    )
    
    settingsNavigationController.tabBarItem = UITabBarItem(
      title: "Menu",
      image: UIImage(named: "ic_menu"),
      selectedImage: nil
    )
  }
  
  @objc private func scanCard() {
    routeToAddContact()
  }
  
}

// MARK:- UITabBarControllerDelegate

extension TabBarController: UITabBarControllerDelegate {
  
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    return true
  }
}

//MARK: - Bind Method

extension TabBarController {
  
  private func bind() {
    
  }
}

extension TabBarController {
  
  private func navigationController(rootViewController: UIViewController) -> UINavigationController {
    let navigationController = UINavigationController(rootViewController: rootViewController)
    navigationController.navigationBar.isHidden = true
    navigationController.interactivePopGestureRecognizer?.isEnabled = false
    return navigationController
  }
}

// MARK: - Routing Methods

extension TabBarController {
  
  private func routeToAddContact() {
    
  }
}
