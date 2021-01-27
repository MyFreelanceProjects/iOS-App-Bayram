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
