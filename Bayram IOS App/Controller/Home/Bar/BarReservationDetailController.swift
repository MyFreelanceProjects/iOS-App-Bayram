//
//  BarReservationDetailController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/26/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class BarReservationDetailController: BaseVC, ReservationDelegate {
    var delegate: ReservationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bar 1"
        
        addReusableView()
    }
    
    
    func addReusableView() {
        let vc = self.getController(id: "R_ReservationDetailController", storyboard: "Reusable") as! R_ReservationDetailController
        vc.delegate = self
        
        // define initialize
        vc.reservationIdentifier = "barReservation"
        vc.feedbackIdentifier = "barFeedback"
        vc.menuIdentifier = "BarMenu"
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.add(vc, frame: self.view.frame)
    }
 
    func addReservationSegue(withIdentifier id: String) {
        navigationItem.backBarButtonItem = self.customBackButton
        performSegue(withIdentifier: id, sender: self)
    }
    
    func showDressCode(type: String) {
        navigationItem.backBarButtonItem = self.customBackButton
        
        // set codeDress Controller Parameters
        performSegue(withIdentifier: "BarDressCodeController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? BarDressCodeController {
            destinationVC.codeTitle = "DRESS CODE"
            // set htmlContent
        }
    }
}
