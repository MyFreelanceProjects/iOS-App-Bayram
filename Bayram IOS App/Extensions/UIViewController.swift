//
//  UIViewController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/20/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

@nonobjc extension UIViewController {
    func add(_ child: UIViewController, frame: CGRect? = nil) {
        addChild(child)

        if let frame = frame {
            child.view.frame = frame
        }

        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove(previousController: UIViewController) {
        previousController.willMove(toParent: nil)
        previousController.view.removeFromSuperview()
        previousController.removeFromParent()
    }
}


extension UIViewController {
    var lang_index: String? {
        return "0"
    }
    
    func delayAfter(seconds delay: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }
    
    var customBackButton: UIBarButtonItem {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        return backItem
    }
    
    func getFcmToken() -> String {
        let fcm_token = UserDefaults.standard.string(forKey: "fcm_token")
        return fcm_token!
    }
    
    func customTextFonts(fontSize: Float) -> UIFont {
        return UIFont(name: "Roboto", size: CGFloat(fontSize))!
    }
    
    var customTitleFont: UIFont {
        return UIFont(name: "BebasNeue-Regular", size: 24)!
    }
}
