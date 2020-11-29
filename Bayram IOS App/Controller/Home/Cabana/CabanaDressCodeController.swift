//
//  CabanaDressCodeController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/26/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit
import WebKit

class CabanaDressCodeController: UIViewController {

    @IBOutlet weak var DressCodeView: WKWebView!
    
    var htmlContent: String = "this is test"
    var codeTitle: String = "DRESS CODE" {
        didSet {
            self.title = codeTitle
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DressCodeView.loadHTMLString(DressCodeView.combineWebViewContent(htmlContent: htmlContent), baseURL: Bundle.main.bundleURL)
    }
    
}
