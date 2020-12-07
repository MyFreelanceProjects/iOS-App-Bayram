//
//  SportJoin.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/6/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class SportJoin: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "JOIN"
        
        addReusableView()
    }
    
    func addReusableView() {
        let vc = self.getController(id: "R_EventAndActivityJoin", storyboard: "Reusable") as! R_EventAndActivityJoin
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.add(vc, frame: self.view.frame)
    }
}
