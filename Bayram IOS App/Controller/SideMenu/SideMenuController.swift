//
//  SideMenuController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/9/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit
import SideMenu

class SideMenuController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sideMenuPressed(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("sideMenuPressed"),
                                        object: nil,
                                        userInfo: ["sideMenuID": sender.tag])
        dismiss(animated: true)
    }
    
}
