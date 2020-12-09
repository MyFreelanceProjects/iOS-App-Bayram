//
//  MapController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/8/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit
import WebKit

class Map: UIViewController {
    @IBOutlet weak var MapView: WKWebView!
    
    var htmlContent: String = "THIS IS <b>MAP</b><br><img width='200' height='113' src='https://www.baxal.az/hotel/img/r03.jpg'/>"
    var codeTitle: String = "DRESS CODE" {
        didSet {
            self.title = codeTitle
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MapView.loadHTMLString(MapView.combineWebViewContent(htmlContent: htmlContent), baseURL: Bundle.main.bundleURL)
    }
    
}
