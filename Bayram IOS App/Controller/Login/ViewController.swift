//
//  ViewController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/7/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

// new line codes

import UIKit
import Toast
import Firebase
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet private weak var ipAdress: UITextField!
    @IBOutlet private weak var userID: UITextField!
    @IBOutlet private weak var password: UITextField!
    @IBOutlet private weak var SignInButton: UIButton!
    @IBOutlet private weak var tabbarContainerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    fileprivate func configureUI() {
        SignInButton.customShadow()
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: self.customTitleFont]
    }

    @IBAction fileprivate func loginPressed(_ sender: UIButton) {
        if !formIsEmpty() {
            /// started activity indicator
            self.view.makeToastActivity(.center)
            
            /// sending request to server
            let loginParam = ["user_id": userID.text!,
                              "password": password.text!,
                              "fcm_token": self.getFcmToken(),
//                              "ip_adress": ipAdress.text!,
            ]
            
            LoginNetworkManager().loginRequest(endpoint: "/sign_in.php", parameters: loginParam) { [self]response in
                self.view.hideToastActivity()

                switch response {
                case.success(let response):
                    if response == 1 {
                        self.view.makeToast("Wrong Password or ID")
                        
                    } else if response == 5 {
                        self.view.makeToast("Check out time has expired")
                        
                    } else {
                        // getting correct result
                        
                        // writing user info to FileManager
                        let jsonDecoder = JSONDecoder()
                        do {
                            let data = try response[0].rawData()
                            let decodedData = try jsonDecoder.decode(UserInfoModel.self, from: data)
                            
                            let propertyListEncoder = PropertyListEncoder()
                            if let plist = try? propertyListEncoder.encode(decodedData) {
                                // writing user info to plist file
                                writeDataToFileManager(pathName: "UserInfo.plist", data: plist)
                                
                                let jsonLanguage = response[0]["languages"]
                                decodingLanguageAndWritingToFile(jsonLanguage: jsonLanguage)
                            }
                        } catch {
                            return
                        }
                    }
                
                case .failure(let error):
                    self.view.makeToast(error.localizedDescription)
                }
            }
            
        } else {
            self.view.makeToast("Please fill all inputs!", duration: 2)
        }
    }
    
    fileprivate func runLocalization(_ rl: RuntimeLocalizable) {
        do {
            try rl.bundle()
            
            changeRouteToHomePage()
        } catch {
            return
        }
    }
    
    fileprivate func decodingLanguageAndWritingToFile(jsonLanguage: JSON) {
        var translations = Dictionary<String, Dictionary<String, String>>()
        jsonLanguage.forEach {
            let langKey  = $1["1"].stringValue
            let langData = $1["language_data"]
            let string = langData.stringValue
            let data = string.data(using: .utf8)!
            
            do {
                if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? Dictionary<String,String>
                {
                    translations[langKey] = jsonArray
                } else {
                    print("bad json")
                }
            } catch let error as NSError {
                print(error)
            }
            
        }
        
        print(translations)
        let rl = RuntimeLocalizable(translations: translations, name: "languages")
        runLocalization(rl)
    }
    
    fileprivate func changeRouteToHomePage() {
        UserDefaults.standard.setValue(true, forKey: "logged")
        
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
        
        /// This is to get the SceneDelegate object from your view controller
        /// then call the changeRootViewController function to change to main tab bar
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    fileprivate func writeDataToFileManager(pathName: String, data: Data) {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        guard let paths = documentDirectory.first else { return }
        let userPath = paths.appendingPathComponent(pathName)
        
        do {
            try data.write(to: userPath)
            print("successfully writed user data")
        } catch {
            return
        }
    }
    
    fileprivate func formIsEmpty() -> Bool {
        if userID.text!.isEmpty || ipAdress.text!.isEmpty || password.text!.isEmpty {
            return true
        } else {
            return false
        }
        
    }
}

// MARK: - UserInfoModel
struct UserInfoModel: Codable {
    let room_number: String?
    let trip_advisor_url: String?
    let _id: String?
    let hotel_token: String?
    let auth_token: String?
    let privilege: String?
    let fullname: String?
    let avatar_url: String?
    let privacy_url: String?
    
    let hotel_names: HotelNameArray
}
struct HotelNameArray: Codable {
    let value_en: String
    let value_ru: String
    let value_de: String
    let value_ar: String
    let value_tr: String
    let variable: String
}

// MARK: - LanguageModel
struct LanguageModel {
    let languageKey: String
    let language_data: [String:String]
}

//Server Name: guliyev
//User ID: 200051
//Password: 123
