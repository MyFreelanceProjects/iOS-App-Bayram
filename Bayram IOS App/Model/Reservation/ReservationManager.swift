//
//  ReservationManager.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 2/1/21.
//  Copyright © 2021 Kanan`s Macbook Pro. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct ReservationManager {
    static let shared = ReservationManager()
    
    /// select
    func select_my_reservations(endpoint: String, params: [String: String] ,completetion: @escaping (Result<JSON, Error>) -> Void) {
        
        guard let url = URL(string: "https://\(NetworkConstants.baseUrl)\(endpoint)") else {
            return
        }
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(Data(params["auth_token"]!.utf8), withName: "auth_token")
            multipartFormData.append(Data(params["user_id"]!.utf8), withName: "user_id")
            multipartFormData.append(Data(params["lang_index"]!.utf8), withName: "lang_index")
            
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

