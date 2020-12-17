//
//  NotificationViewController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/19/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class NotificationViewController: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // for side menu
        NotificationCenter.default.addObserver(
                                        self,
                                       selector: #selector(sideMenuPressing(_:)),
                                       name: NSNotification.Name("sideMenuPressed"),
                                       object: nil)
        
        NotificationCenter.default.addObserver(
                                         self,
                                        selector: #selector(tabBarClicked(_:)),
                                        name: NSNotification.Name("tabBarChanged"),
                                        object: nil)
        
        delayAfter(seconds: 0.1) {
            self.getInitialVC(identifier: "Notification", storyboard: "Notification")
        }
    }
    
    @objc func tabBarClicked(_ notification: NSNotification) {
        if let user_info = notification.userInfo as NSDictionary? {
            if let selected = user_info["selected"] as! Int? {
                if selected == 1 {
                    delayAfter(seconds: 0.1) {
                        self.remove(previousController: self.children[0])
                        self.getInitialVC(identifier: "Notification", storyboard: "Notification")
                    }
                }
            }
        }
    }
    
    @objc func sideMenuPressing(_ notification: NSNotification) {
        if let user_info = notification.userInfo as NSDictionary? {
            if let sideMenuID = user_info["sideMenuID"] as? Int {
                
                var idf = ""
                var storyboard = ""
                
                switch sideMenuID {
                    case 1:
                        idf = "showMainPage"
                        storyboard = "Home"
                    
                    case 2:
                        idf = "showAccount"
                        storyboard = "Account"
                    
                    case 3:
                        idf = "showReservation"
                        storyboard = "Reservations"
                    
                    case 4:
                        idf = "showFeedback"
                        storyboard = "Feedback"
                    
                    case 5:
                        idf = "WeatherViewController"
                        storyboard = "Weather"
                    
                    default:
                        idf = "showMainPage"
                        storyboard = "Home"
                }
                delayAfter(seconds: 0.1) {
                    self.remove(previousController: self.children[0])
                    
                    self.getInitialVC(identifier: idf, storyboard: storyboard)
                }
            }
        }
    }

}
