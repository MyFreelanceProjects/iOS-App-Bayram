//
//  AlertService.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/13/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class AlertService: UIViewController {

    func info (bodyText: String, buttonTitle: String) -> InfoViewController {
        let alertVC = self.getViewController(storyboardName: "AlertViewControllers", identifier: "infoAlert") as! InfoViewController
        
        alertVC.alertTitle = title
        alertVC.bodyText = bodyText
        alertVC.buttonTitle = buttonTitle
        
        return alertVC
    }
    
    func getDate(title: String, ButtonName: String, dataMode: UIDatePicker.Mode, completion: @escaping (_ settedTime: UIDatePicker) -> Void) -> DateViewController {
        let alertVC = self.getViewController(storyboardName: "AlertViewControllers", identifier: "timeAlert") as! DateViewController
        
        alertVC.setTitle = title
//        alertVC.setDate = date
        alertVC.setButtonName = ButtonName
        alertVC.dataMode = dataMode
        alertVC.buttonAction = completion
        
        
        return alertVC
    }
    
    
    
    func getViewController(storyboardName: String, identifier: String) ->UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: .main)
        let alertVC = storyboard.instantiateViewController(identifier: identifier)
    
        return alertVC
    }
}
