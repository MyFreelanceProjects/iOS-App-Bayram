//
//  LoginManager.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/18/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
//
struct LoginNetworkManager {
    
    func loginRequest(endpoint: String, parameters: [String: String], completetion: @escaping (Result<JSON, Error>) -> Void) {
        guard let url = URL(string: "https://\(NetworkConstants.baseUrl)\(endpoint)") else {
            return
        }
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(Data(parameters["user_id"]!.utf8), withName: "user_id")
            multipartFormData.append(Data(parameters["password"]!.utf8), withName: "password")
            multipartFormData.append(Data(parameters["fcm_token"]!.utf8), withName: "fcm_token")

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

enum NetworkError: Error {
    case badUrl
    case decodingProblem
}

enum LoginInfo: JSON {
    case wrongInformation
    case successLogin
}
