//
//  GettingUserDataFromManager.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 1/25/21.
//  Copyright © 2021 Kanan`s Macbook Pro. All rights reserved.
//

import Foundation

struct GettingUserDataFromManager {
    static let sharedInstance = GettingUserDataFromManager()

    func decodeUserInfo(completetion: @escaping(_ user_info: UserInfoModel?) -> Void) {
        guard let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else{ return }
        
        let userDataPath = dataFilePath.appendingPathComponent("UserInfo.plist")
        
        do {
            let userData = try Data(contentsOf: userDataPath)
            
            let decoder = PropertyListDecoder()
            let decodedData = try decoder.decode(UserInfoModel.self, from: userData)
            
            completetion(decodedData)
        } catch  {
            completetion(nil)
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
