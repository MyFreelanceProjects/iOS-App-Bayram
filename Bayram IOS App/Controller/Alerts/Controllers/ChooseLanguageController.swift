//
//  ChooseLanguageController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/18/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class ChooseLanguageController: UIViewController {
    @IBOutlet weak var alertTitle: UILabel!
    @IBOutlet weak var alertPicker: UIPickerView!
    @IBOutlet weak var buttonTitle: UIButton!
    
    var setTitle: String? = nil
    var setButtonName: String? = nil
    var buttonAction: (() -> Void)?

    private let pickerData = ["Türkçe", "Русский", "English", "Deutsche", "عرب"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.alertPicker.delegate = self
        self.alertPicker.dataSource = self
        
        configure()
    }

    func configure() {
        self.alertTitle.text = setTitle
        self.buttonTitle.setTitle(setButtonName, for: .normal)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}



//MARK: - UIPickerViewDelegate & UIPickerViewDataSource

extension ChooseLanguageController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let pickedLang = pickerData[row]
        print(pickedLang)
    }
    
}
