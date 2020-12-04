//
//  HouseK_Laundry.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/2/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class HouseK_Laundry: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    let alert = AlertService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "LAUNDRY"

        
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        let alertVC = alert.info(bodyText: "Thanks you! We will fulfill your order as soon as possible.", buttonTitle: "Close")
        
        present(alertVC, animated: true)
    }
}
