//
//  SpecialDDressCodeController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/5/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit
import WebKit

class SDinnerDressCodeController: UIViewController {
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
