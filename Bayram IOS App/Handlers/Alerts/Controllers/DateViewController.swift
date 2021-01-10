//
//  TimeViewController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/13/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {
    @IBOutlet weak var alertTitle: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var buttonTitle: UIButton!
    
    var setTitle: String? = nil
//    var setDate: Date? = nil
    var setButtonName: String? = nil
    var dataMode: UIDatePicker.Mode? = .date
    var buttonAction: ((_ settedTime: UIDatePicker) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    func setupView() {
        alertTitle.text = setTitle
//        self.datePicker.date = setDate!
        buttonTitle.setTitle(setButtonName, for: .normal)
        datePicker.datePickerMode = dataMode!
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        dismiss(animated: true)
        buttonAction?(datePicker)
    }
    
    
}
