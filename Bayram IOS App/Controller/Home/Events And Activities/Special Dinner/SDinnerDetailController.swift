//
//  SDinnerDetailController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/5/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class SDinnerDetailController: BaseVC, ReservationDelegate {
    var delegate: ReservationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Special Dinner 1".uppercased()
        
        addReusableView()
    }
    
    
    func addReusableView() {
        let vc = self.getController(id: "R_ReservationDetailController", storyboard: "Reusable") as! R_ReservationDetailController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.delegate = self
        
        // define initialize
        vc.reservationIdentifier = "SDinnerReservation"
        vc.feedbackIdentifier = "SDinnerFeedback"
        vc.menuIdentifier = "SDinnerMenu"
        
        self.add(vc, frame: self.view.frame)
    }
 
    func addReservationSegue(withIdentifier id: String) {
        navigationItem.backBarButtonItem = self.customBackButton
        performSegue(withIdentifier: id, sender: self)
    }
    
    func showDressCode(type: String) {
        navigationItem.backBarButtonItem = self.customBackButton
        
        // set codeDress Controller Parameters
        performSegue(withIdentifier: "SDinnerDressCodeController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? SDinnerDressCodeController {
            destinationVC.codeTitle = "DRESS CODE"
            // set htmlContent
        }
    }
}

