//
//  CabanaReservationDetailController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/26/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class CabanaReservationDetailController: BaseVC, ReservationDelegate {

    var delegate: ReservationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cabana 1"
        
        addReusableView()
    }
    
    func addReusableView() {
        let vc = self.getController(id: "R_ReservationDetailController", storyboard: "Reusable") as! R_ReservationDetailController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.delegate = self
        
        // define initialize
        vc.reservationIdentifier = "cabanaReservation"
        vc.feedbackIdentifier = "cabanaFeedback"
        vc.menuIdentifier = "CabanaMenu"
        
        self.add(vc, frame: self.view.frame)
    }
 
    func addReservationSegue(withIdentifier id: String) {
        navigationItem.backBarButtonItem = self.customBackButton
        performSegue(withIdentifier: id, sender: self)
    }
    
    func showDressCode(type: String) {
        navigationItem.backBarButtonItem = self.customBackButton
        
        // set codeDress Controller Parameters
        performSegue(withIdentifier: "CabanaDressCodeController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? CabanaDressCodeController {
            destinationVC.codeTitle = "DRESS CODE"
            // set htmlContent
        }
    }
}
