//
//  NetworkManager.swift
//  Bayram IOS App
//
//  Created by Ulvi Valiyev on 1/27/21.
//  Copyright © 2021 Kanan`s Macbook Pro. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct NetworkManager {
    
    func request(endpoint: String, multipartFormData: MultipartFormData, completetion: @escaping (Result<JSON, Error>) -> Void) {
        guard let url = URL(string: "https://\(NetworkConstants.baseUrl)\(endpoint)") else {
            return
        }
        
        AF.upload(multipartFormData: multipartFormData, to: url).responseJSON { (response) in
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

enum NetworkManagerError: Error {
    case badUrl
    case decodingProblem
}

enum NetworkManagerInfo: JSON {
    case wrongInformation
    case successLogin
}
