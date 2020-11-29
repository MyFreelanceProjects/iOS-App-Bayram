//
//  SpaReadMore.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/29/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class SpaReadMore: UIViewController {
    @IBOutlet weak var textArea: UILabel!
    
    var viewTitle: String? = "" {
        didSet {
            self.title = viewTitle
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
