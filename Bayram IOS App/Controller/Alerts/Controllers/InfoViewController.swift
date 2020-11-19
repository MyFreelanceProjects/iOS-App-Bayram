//
//  InfoViewController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/12/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var buttonName: UIButton!
    
    
    // initialize
    var alertTitle: String? = nil
    var buttonTitle: String? = nil
    var bodyText: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        self.body.text = bodyText
        self.buttonName.setTitle(buttonTitle, for: .normal)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
