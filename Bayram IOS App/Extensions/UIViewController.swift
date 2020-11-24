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
}
