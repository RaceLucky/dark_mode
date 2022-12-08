//
//  StoryboardScene.swift
//  DarkModeExample
//
//  Created by Galexy on 09/05/2022.


import Foundation
import UIKit

class StoryboardScene {
  
  static let Main: UIStoryboard = {
    return UIStoryboard(name: "Main", bundle: nil)
  }()
  
  static let Account: UIStoryboard = {
    return UIStoryboard(name: "Account", bundle: nil)
  }()

  static let Profile: UIStoryboard = {
    return UIStoryboard(name: "Profile", bundle: nil)
  }()

  static let Connections: UIStoryboard = {
    return UIStoryboard(name: "Connections", bundle: nil)
  }()

  static let Settings: UIStoryboard = {
    return UIStoryboard(name: "Settings", bundle: nil)
  }()

  static let Share: UIStoryboard = {
    return UIStoryboard(name: "Share", bundle: nil)
  }()
}

extension UIStoryboard {
  
  func controllerExists(withIdentifier: String) -> Bool {
    if let availableIdentifiers = self.value(forKey: "identifierToNibNameMap") as? [String: Any] {
      return availableIdentifiers[withIdentifier] != nil
    }
    
    return false
  }
  
  func instantiateViewController<VC: UIViewController>(withClass: VC.Type) -> VC {
    let identifier = NSStringFromClass(withClass as AnyClass).components(separatedBy: ".")[1]
    guard controllerExists(withIdentifier: identifier) else {
      fatalError("Failed to instantiate viewController")
    }
    
    return instantiateViewController(withIdentifier: identifier) as! VC
  }
}
