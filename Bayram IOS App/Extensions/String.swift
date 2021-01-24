//
//  Extensions.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/14/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit
import Foundation

extension String {
    
    func localized() -> String {
        let bundlePath = Bundle.main.path(forResource: "en", ofType: "lproj")
        let bundle     = Bundle(path: bundlePath!)!
        return NSLocalizedString("entertainment_header", tableName: "", bundle: bundle, value: "", comment: "")
        
//        return NSLocalizedString("entertainment_header", tableName: "", bundle: LocalizationManager().currentBundle, value: "", comment: "")
    }
    
    var formattedDate: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZZZZ"
        
        if let date = dateFormatter.date(from: self) {
            //print(date)
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: date)
        }
        return nil
    }
    
    var formatterTime: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZZZZ"
        
        if let date = dateFormatter.date(from: self) {
            //print(date)
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: date)
        }
        return nil
    }
    
}
