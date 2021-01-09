//
//  AddReservationCabanaController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/26/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class AddReservationCabanaController: BaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "RESERVATION"
        
        
        addReusableView()
    }
    
    
    func addReusableView() {
        let vc = self.getController(id: "R_EditReservations2", storyboard: "Reusable") as! R_EditReservations2
        
        // define initialize
        
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.add(vc, frame: self.view.frame)
    }
}
