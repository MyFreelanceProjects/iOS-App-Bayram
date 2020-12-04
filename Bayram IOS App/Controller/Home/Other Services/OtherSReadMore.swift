//
//  OtherSReadMore.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/2/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class OtherSReadMore: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    
    var viewTitle: String = "" {
        didSet {
            self.title = viewTitle
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
}
 
