//
//  SelectorController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/28/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class SelectorController: UIViewController {
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var alertButton: UIButton!
    
    var selectorData: [String]?
    var setButtonName: String?
    var buttonAction: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    func configure() {
        self.alertButton.setTitle(setButtonName, for: .normal)
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        dismiss(animated: true)
    }

}

//MARK: -  UIPickerViewDataSource, UIPickerViewDelegate

extension SelectorController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return selectorData!.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return selectorData![row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("selected")
    }
}
