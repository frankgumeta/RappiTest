//
//  Storyboard+Extension.swift
//  RappiTest
//
//  Created by Francisco Eduardo Toledo Gumeta on 8/12/19.
//  Copyright © 2019 Frank Gumeta. All rights reserved.
//

import UIKit

extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard
    }
    
    class func controller<T: BaseController>(with controllerClass: T.Type) -> T {
        let identifier = String(describing: controllerClass)
        guard let controller = mainStoryboard().instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("\(identifier) class does not exist.")
        }
        return controller
    }
}
