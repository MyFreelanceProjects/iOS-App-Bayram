//
//  AccountManager.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 1/25/21.
//  Copyright © 2021 Kanan`s Macbook Pro. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct AccountManager {
    static let sharedInstance = AccountManager()
    
    func getUserInfo(endpoint: String, params: [String: String] ,closure: @escaping () -> Void) {
        
        guard let url = URL(string: "https://\(NetworkConstants.baseUrl)\(endpoint)") else {
            return
        }
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(Data(params["auth_token"]!.utf8), withName: "auth_token")
            multipartFormData.append(Data(params["user_id"]!.utf8), withName: "user_id")
            multipartFormData.append(Data(params["privilege"]!.utf8), withName: "privilege")

        }, to: url).responseJSON { (response) in
            switch response.result {
            case .success(let data):
                let json: JSON = JSON(data)
                
                print(json)
//                completetion(.success(json))
                
            case .failure(let e): break
//                completetion(.failure(e))
            }
        }
        
    }
    
}


//{
//  "9" : "1.8.10",
//  "child_count" : "0",
//  "6" : "0",
//  "check_out_time" : "2021-02-28 12:00:00",
//  "(SELECT room_number FROM rooms WHERE _id = room_id)" : "100",
//  "4" : "100",
//  "8" : "Family Corner Suite",
//  "1" : null,
//  "check_in_time" : "2021-01-13 12:00:00",
//  "(SELECT value_en FROM settings WHERE variable = 'version_code')" : "1.8.10",
//  "(SELECT fullname FROM users WHERE _id = '200051')" : "Kanan",
//  "3" : "2021-02-28 12:00:00",
//  "7" : "0",
//  "5" : "1",
//  "(SELECT avatar_url FROM users WHERE _id = '200051')" : null,
//  "adult_count" : "1",
//  "baby_count" : "0",
//  "2" : "2021-01-13 12:00:00",
//  "0" : "Kanan",
//  "(SELECT class FROM room_classes WHERE _id = (SELECT class_id FROM rooms WHERE _id = room_id))" : "Family Corner Suite"
//}
