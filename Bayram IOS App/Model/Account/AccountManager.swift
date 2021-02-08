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
    
    func getUserInfo(endpoint: String, params: [String: String] ,completetion: @escaping (Result<JSON, Error>) -> Void) {
        
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

                completetion(.success(json))
                
            case .failure(let e): break
                completetion(.failure(e))
            }
        }
        
    }
    
    func editProfileImage(endpoint: String, params: [String: String] ,completetion: @escaping (Result<JSON, Error>) -> Void){
        
        guard let url = URL(string: "https://\(NetworkConstants.baseUrl)\(endpoint)") else {
            return
        }
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(Data(params["auth_token"]!.utf8), withName: "auth_token")
            multipartFormData.append(Data(params["user_id"]!.utf8), withName: "user_id")
            multipartFormData.append(Data(params["encoded_image"]!.utf8), withName: "encoded_image")
            

        }, to: url).responseJSON { (response) in
            switch response.result {
            case .success(let data):
                let json: JSON = JSON(data)

                completetion(.success(json))
                
            case .failure(let e):
                completetion(.failure(e))
            }
        }
        
    }
    
}
