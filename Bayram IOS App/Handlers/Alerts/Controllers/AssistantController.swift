//
//  AssistantController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/14/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class AssistantController: UIViewController {
    
    @IBOutlet weak var alertTitle: UILabel!
    @IBOutlet weak var alertStatus: UILabel!
    @IBOutlet weak var alertTimeInterval: UILabel!
    @IBOutlet weak var alertButtonTitle: UIButton!
    @IBOutlet weak var statusView: UIView!
    
    var userName: String = ""
    var userStatus: String = ""
    var timeInterval: String = ""
    var buttonTitle: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    func configureUI() {
        alertTitle.text = userName
        alertStatus.text = userStatus
        alertTimeInterval.text = timeInterval
        alertButtonTitle.setTitle(buttonTitle, for: .application)
        statusView.customBorder = 0.3
    }
    
    
    @IBAction func closeClicked(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
