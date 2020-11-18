//
//  SideMenuController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/9/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class SideMenuController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func mainPageButtonPressed(_ sender: UIButton) {
        
        if let viewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "showMainPage") as? HomeViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    
    @IBAction func accountButtonPressed(_ sender: UIButton) {
        if let viewController = UIStoryboard(name: "Account", bundle: nil).instantiateViewController(withIdentifier: "showAccount") as? AccountViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    @IBAction func reservationPressed(_ sender: UIButton) {
        if let viewController = UIStoryboard(name: "Reservations", bundle: nil).instantiateViewController(withIdentifier: "showReservation") as? ReservationsViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    @IBAction func feedbackPressed(_ sender: UIButton) {
        print("clicked")
        if let viewController = UIStoryboard(name: "Feedback", bundle: nil).instantiateViewController(withIdentifier: "showFeedback") as? FeedbackViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    
}
