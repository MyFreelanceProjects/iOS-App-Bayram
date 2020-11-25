//
//  WkWebView.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/25/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import Foundation
import WebKit

extension WKWebView {
    func combineWebViewContent(htmlContent: String) -> String {
        let htmlStart = "<HTML><HEAD><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, shrink-to-fit=no\"></HEAD><BODY>"
        let htmlEnd = "</BODY></HTML>"
        return "\(htmlStart)\(htmlContent)\(htmlEnd)"
    }
}
