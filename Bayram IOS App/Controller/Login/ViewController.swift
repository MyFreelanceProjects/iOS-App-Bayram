//
//  ViewController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/7/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit
import Toast
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var ipAdress: UITextField!
    @IBOutlet weak var userID: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var SignInButton: UIButton!
    @IBOutlet weak var tabbarContainerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
//        last test from local
    }
    
    func configureUI() {
        SignInButton.customShadow()
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: self.customTitleFont]
    }

    @IBAction func loginPressed(_ sender: UIButton) {
//        if !formIsEmpty() {
//            // started activity indicator
//            self.view.makeToastActivity(.center)
//            
//            // sending request to server
//            let loginParam = ["user_id": userID.text!,
//                              "password": password.text!,
//                              "fcm_token": self.getFcmToken(),
////                              "ip_adress": ipAdress.text!,
//            ]
//            
//            LoginNetworkManager().loginRequest(endpoint: "/sign_in.php", parameters: loginParam) {response in
//                self.view.hideToastActivity()
//                
//                switch response {
//                case.success(let response):
//                    if response == 1 {
//                        self.view.makeToast("Wrong Password or ID")
//                        
//                    } else if response == 5 {
//                        self.view.makeToast("Check out time has expired")
//                        
//                    } else {
//                        // getting correct result
//                        print(response)
//                        
//                            let storyboard = UIStoryboard(name: "Home", bundle: nil)
//                            let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
//                        
//                            // This is to get the SceneDelegate object from your view controller
//                            // then call the changeRootViewController function to change to main tab bar
//                            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
//                    }
//                
//                case .failure(let error):
//                    self.view.makeToast(error.localizedDescription)
//                }
//            }
//            
//        } else {
//            self.view.makeToast("Please fill all inputs!", duration: 2)
//        }
        
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")

        // This is to get the SceneDelegate object from your view controller
        // then call the change root view controller function to change to main tab bar
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
//
    }
    
    func formIsEmpty() -> Bool {
        if userID.text!.isEmpty || ipAdress.text!.isEmpty || password.text!.isEmpty {
            return true
        } else {
            return false
        }
        
    }
}

