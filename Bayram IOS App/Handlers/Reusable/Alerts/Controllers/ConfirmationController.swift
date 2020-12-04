//
//  ConfirmationController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/3/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class ConfirmationController: UIViewController {
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var acceptButton: UIButton!
    
    
    
    // initialize
    var alertTitle: String? = nil
    var buttonFirst: String? = nil
    var buttonSecond: String? = nil
    var bodyText: String? = nil
    var buttonTextHidden: Bool = false
    var buttonAction: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        self.body.text = bodyText
        self.cancelButton.setTitle(buttonFirst, for: .normal)
        self.acceptButton.setTitle(buttonSecond, for: .normal)
        self.body.isHidden = buttonTextHidden
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirmationPressed(_ sender: UIButton) {
        dismiss(animated: true)
        
        buttonAction?()
    }
    
}
