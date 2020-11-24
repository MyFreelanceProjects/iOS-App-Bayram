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
        let alertVC = self.getViewController(identifier: "infoAlert") as! InfoViewController
        
        alertVC.alertTitle = title
        alertVC.bodyText = bodyText
        alertVC.buttonTitle = buttonTitle
        
        return alertVC
    }
    
    func getDate(title: String, ButtonName: String, dataMode: UIDatePicker.Mode, completion: @escaping (_ settedTime: UIDatePicker) -> Void) -> DateViewController {
        let alertVC = self.getViewController(identifier: "timeAlert") as! DateViewController
        
        alertVC.setTitle = title
//        alertVC.setDate = date
        alertVC.setButtonName = ButtonName
        alertVC.dataMode = dataMode
        alertVC.buttonAction = completion
        
        
        return alertVC
    }
    
    func addPerson(title: String, buttonName: String, completion: @escaping (_ first: String?, _ second: String?, _ third: String?) -> Void) -> addPersonViewController {
        let alertVC = self.getViewController(identifier: "addPerson") as! addPersonViewController
        
        alertVC.setTitle = title
        alertVC.setButtonName = buttonName
        alertVC.buttonAction = completion
        
        return alertVC
    }
    
    func getLanguageSelectAlert(setTitle: String, ButtonName: String, completion: @escaping () -> Void) -> ChooseLanguageController {
        let alertVC = self.getViewController(identifier: "chooseLanguage") as! ChooseLanguageController
        
        alertVC.setTitle = setTitle
        alertVC.setButtonName = ButtonName
        
        return alertVC
    }
    
    func getSoundsSelector(setTitle: String, completion: @escaping () -> Void) -> SoundsViewController {
        let alertVC = self.getViewController(identifier: "chooseSounds") as! SoundsViewController
        
        alertVC.setTitle = setTitle
        alertVC.buttonAction = completion
        
        return alertVC
    }
    func getSingleSoundsSelector(buttonName: String, completion: @escaping () -> Void) -> SelectSingleSoundController {
        let alertVC = self.getViewController(identifier: "chooseSingleSound") as! SelectSingleSoundController
        
        alertVC.setButtonName = buttonName
        alertVC.buttonAction = completion
        
        return alertVC
    }
    
    
    func getViewController(identifier: String) ->UIViewController {
        let storyboard = UIStoryboard(name: "AlertViewControllers", bundle: .main)
        let alertVC = storyboard.instantiateViewController(identifier: identifier)
    
        return alertVC
    }
}
