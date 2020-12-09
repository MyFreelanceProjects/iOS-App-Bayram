//
//  MapViewController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/19/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class MapViewController: BaseVC {

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
            self.getInitialVC()
        }

    }
    
    @objc func tabBarClicked(_ notification: NSNotification) {
        if let user_info = notification.userInfo as NSDictionary? {
            if let selected = user_info["selected"] as! Int? {
                if selected == 0 {
                    delayAfter(seconds: 0.1) {
                        self.remove(previousController: self.children[0])
                        self.getInitialVC(identifier: "Map", storyboard: "Map")
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

class BaseVC: UIViewController {
    func getInitialVC(identifier: String? = "showMainPage", storyboard: String? = "Home") {
        let vc = self.getController(id: identifier!, storyboard: storyboard!) as! UINavigationController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.add(vc, frame: self.view.frame)
    }
    
    func getController(id: String, storyboard: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: id)
    }
}
