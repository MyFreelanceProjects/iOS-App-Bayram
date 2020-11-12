//
//  AlertService.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/13/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class AlertService: UIViewController {

    func info (title: String, bodyText: String, buttonTitle: String) -> InfoViewController {
        
        let storyboard = UIStoryboard(name: "AlertViewControllers", bundle: .main)
        let alertVC = storyboard.instantiateViewController(identifier: "infoAlert") as! InfoViewController
        
        alertVC.alertTitle = title
        alertVC.bodyText = bodyText
        alertVC.buttonTitle = buttonTitle
        
        return alertVC
    }
}
