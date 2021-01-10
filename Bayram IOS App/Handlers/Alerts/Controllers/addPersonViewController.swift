//
//  addPersonViewController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/15/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class addPersonViewController: UIViewController {
    @IBOutlet weak var alertTitle: UILabel!
    @IBOutlet weak var thirdPerson: UITextField!
    @IBOutlet weak var secondPerson: UITextField!
    @IBOutlet weak var firstPerson: UITextField!
    @IBOutlet weak var buttonTitle: UIButton!
    
    var setTitle: String? = nil
    var setButtonName: String? = nil
    var buttonAction: ((_ first: String?, _ second: String?, _ third: String?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        self.alertTitle.text = setTitle
        self.buttonTitle.setTitle(setButtonName, for: .normal)
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        buttonAction?(firstPerson.text,
                      secondPerson.text,
                      thirdPerson.text)
        
        dismiss(animated: true)
    }
    
}
