//
//  UIViewController + Storyboard.swift
//  iMusic
//
//  Created by Danya Kukhar on 18.08.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    class func loadFromSoryboard<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() as? T {
            return viewController
        } else {
            fatalError("Error No initial view controller in \(name) storyboard")
        }
    }
        
}
