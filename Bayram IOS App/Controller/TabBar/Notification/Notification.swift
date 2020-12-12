//
//  NotificationController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/8/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit
import Segmentio

class Notification: BaseVC {
    @IBOutlet weak var thisView: UIView!
    @IBOutlet weak var notifyView: UIView!
    @IBOutlet weak var firstLine: UIView!
    @IBOutlet weak var secondLine: UIView!
    @IBOutlet weak var thirdLine: UIView!
    
    @IBOutlet var topViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        
        notifyView.subviews.forEach({ $0.removeFromSuperview() })
        
        let vc = self.getController(id: "EventNotf", storyboard: "Notification") as! EventNotf
        
        self.addSubMenuView(vc: vc)
    }
    
    func configureUI() {
        for v in topViews {
            v.cornerRadius = v.frame.size.width/2
        }
        
        thisView.dropShadowView(color: .black, opacity: 0.5, offSet: CGSize(width: 1, height: -1), radius: 3, scale: true)
        
        firstLine.isHidden = false
        secondLine.isHidden = true
        thirdLine.isHidden = true
    }
    
    @IBAction func viewChanged(_ sender: UIButton) {
        notifyView.subviews.forEach({ $0.removeFromSuperview() })
        
        switch sender.tag {
            case 1:
                let vc = self.getController(id: "EventNotf", storyboard: "Notification") as! EventNotf
                
                firstLine.isHidden = false
                secondLine.isHidden = true
                thirdLine.isHidden = true
                self.addSubMenuView(vc: vc)
            
            case 2:
                let vc = self.getController(id: "ServiceNotf", storyboard: "Notification") as! ServiceNotf
                
                firstLine.isHidden = true
                secondLine.isHidden = false
                thirdLine.isHidden = true
                self.addSubMenuView(vc: vc)
            
            case 3:
                let vc = self.getController(id: "ReservationNotf", storyboard: "Notification") as! ReservationNotf
                
                firstLine.isHidden = true
                secondLine.isHidden = true
                thirdLine.isHidden = false
                
                self.addSubMenuView(vc: vc)

            default:
                return
        }

    }
    
    func addSubMenuView(vc: UIViewController) {
        let EventView = vc.view!
        notifyView.addSubview(EventView)
        addChild(vc)
        notifyView.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
    
    
}
