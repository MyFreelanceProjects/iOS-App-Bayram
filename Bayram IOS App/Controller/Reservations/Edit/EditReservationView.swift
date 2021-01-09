//
//  EditReservationView.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/13/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class EditReservationView: BaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addReusableView()
    }
    
    
    func addReusableView() {
        let vc = self.getController(id: "R_EditReservations", storyboard: "Reusable") as! R_EditReservations
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.add(vc, frame: self.view.frame)
    }
    
}
