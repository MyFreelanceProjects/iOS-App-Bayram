//
//  SoundsViewController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/19/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class SoundsViewController: UIViewController {
    @IBOutlet weak var alertTitle: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var reservationLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    
    var setTitle: String? = nil
    var buttonAction: (() -> Void)?
    
    let alertVC = AlertService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }

    func configure() {
        self.alertTitle.text = setTitle
    }
    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        // check button tag -> sender.tag: 1, 2, 3, 4
        let alert = alertVC.getSingleSoundsSelector(buttonName: "Save") {
            print("selected")
        }
        
        present(alert, animated: true)
    }
}
