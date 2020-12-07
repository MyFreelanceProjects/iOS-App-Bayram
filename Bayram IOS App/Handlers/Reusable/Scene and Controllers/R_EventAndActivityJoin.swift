//
//  R_EventAndActivityJoin.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/6/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class R_EventAndActivityJoin: UIViewController {

    // - IBOutlets
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var fourthView: UIView!
    
    @IBOutlet weak var topText: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var personLabel: UILabel!
    
    var dateAndPersons = [
        "date" : "Date",
        "time" : "Time",
        "firstPerson" : "0",
        "secondPerson" : "0",
        "thirdPerson" : "0",
        "avaible_person": "21"
    ]

    let alert = AlertService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        firstView.customBorder = 0.3
        fourthView.customBorder = 0.3
        
    }
    
    @IBAction func setDate() {
        // get alert action
        let alertVC = alert.getDate(title: "Select Date", ButtonName: "Save", dataMode: .date) { settedTime in
            
            
            self.dateAndPersons["date"] = "\(settedTime.date)".formattedDate
        }
        present(alertVC, animated: true)
    }
    
    @IBAction func setPerson() {
        // get alert action
        let alertVC = alert.addPerson(title: "Type person count", buttonName: "Ok") { (first, second, third) in
            self.dateAndPersons["firstPerson"] = first ?? "0"
            self.dateAndPersons["secondPerson"] = second ?? "0"
            self.dateAndPersons["thirdPerson"] = third ?? "0"

        }
        
        present(alertVC, animated: true)
    }
    
}
