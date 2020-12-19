//
//  MyTabBarController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/7/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.itemPositioning =  UITabBar.ItemPositioning.fill
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // getting tab bar controllers
        var selected: Int = 0
        switch item.tag {
            case 0:
                selected = 0
            case 1:
                selected = 1
            case 2:
                selected = 2
            
            default:
                return
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("tabBarChanged"),
                                        object: nil,
                                        userInfo: ["selected": selected])
    }
    
}
