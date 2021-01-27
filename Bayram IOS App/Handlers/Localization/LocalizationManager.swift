//
//  LocalizationManager.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 1/23/21.
//  Copyright © 2021 Kanan`s Macbook Pro. All rights reserved.
//

import Foundation

class LocalizationManager {
    var currentBundle = Bundle.main
        
    let manager = FileManager.default
    lazy var bundlePath: URL = {
        let documents = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!)
        let bundlePath = documents.appendingPathComponent(RuntimeLocalizable.bundleName, isDirectory: true)
        return bundlePath
    }()
    
    public func returnCurrentBundleForLanguage(lang:String) throws -> Bundle {
        if manager.fileExists(atPath: bundlePath.path) == false {
            return Bundle(path: getPathForLocalLanguage(language: lang))!
        }
        do {
            let resourceKeys : [URLResourceKey] = [.creationDateKey, .isDirectoryKey]
            _ = try manager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let enumerator = FileManager.default.enumerator(at: bundlePath ,
                                                            includingPropertiesForKeys: resourceKeys,
                                                            options: [.skipsHiddenFiles], errorHandler: { (url, error) -> Bool in
                                                                return true
            })!
            for case let folderURL as URL in enumerator {
                _ = try folderURL.resourceValues(forKeys: Set(resourceKeys))
                if folderURL.lastPathComponent == ("\(lang).lproj"){
                    let enumerator2 = FileManager.default.enumerator(at: folderURL,
                                                                     includingPropertiesForKeys: resourceKeys,
                                                                     options: [.skipsHiddenFiles], errorHandler: { (url, error) -> Bool in
                                                                        return true
                    })!
                    for case let fileURL as URL in enumerator2 {
                        _ = try fileURL.resourceValues(forKeys: Set(resourceKeys))
                        if fileURL.lastPathComponent == "languages.strings" {
                            return Bundle(url: folderURL)!
                        }
                    }
                }
            }
        } catch {
            return Bundle(path: getPathForLocalLanguage(language: lang))!
        }
        return Bundle(path: getPathForLocalLanguage(language: lang))!
    }
    
    private func getPathForLocalLanguage(language: String) -> String {
        return Bundle.main.path(forResource: language, ofType: "lproj")!
    }
    
    func setCurrentBundle(forLanguage:String){
        do {
            currentBundle = try returnCurrentBundleForLanguage(lang: forLanguage)
        }catch {
            currentBundle = Bundle(path: getPathForLocalLanguage(language: "en"))!
        }
    }
}
