//
//  RoomServiceFeedback.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/3/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class RoomServiceFeedback: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FEEDBACK"
        
        addReusableView()
    }
    
    func addReusableView() {
        let vc = self.getController(id: "R_DetailFeedback", storyboard: "Reusable") as! R_DetailFeedback
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.add(vc, frame: self.view.frame)
    }
}
