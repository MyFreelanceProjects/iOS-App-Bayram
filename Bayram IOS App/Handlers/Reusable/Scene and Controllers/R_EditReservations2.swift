//
//  R_EditReservations2.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/27/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class R_EditReservations2: UIViewController {
    
    // - IBOutlets
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthView: UIView!
    @IBOutlet weak var fifthView: UIView!
    
    
    @IBOutlet weak var topText: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var freeLabel: UILabel!
    @IBOutlet weak var freeCount: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var personLabel: UILabel!
    
    @IBOutlet weak var thisViews: UIView!
    @IBOutlet weak var quantityButton: UIButton!
    
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
        secondView.customBorder = 0.3
        thirdView.customBorder = 0.3
        fourthView.customBorder = 0.3
        fifthView.customBorder = 0.3
        
        freeCount.layer.addBorder(edge: .left, color: .black, thickness: 0.3)
        quantityButton.layer.addBorder(edge: .left, color: .black, thickness: 0.3)
    }
    
    @IBAction func setDate() {
        // get alert action
        let alertVC = alert.getDate(title: "Select Date", ButtonName: "Save", dataMode: .date) { settedTime in
            
            
            self.dateAndPersons["date"] = "\(settedTime.date)".formattedDate
        }
        present(alertVC, animated: true)
    }
    
    @IBAction func setTime() {
        // get alert action
        let alertVC = alert.getDate(title: "Select Time", ButtonName: "Save", dataMode: .time) { settedTime in
            print(settedTime.date)
            // executed this response: 2021-11-15 19:39:18 +0000
            
            self.dateAndPersons["time"] = "\(settedTime.date)".formatterTime
            // refresh tableView for changing label
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
    
    @IBAction func quantityButtonPressed(_ sender: UIButton) {
        let alertVC = alert.getSelector(selectorData: ["1", "2", "3", "4",], buttonName: "Ok") {
            print(":selected")
        }
        
        present(alertVC, animated: true)
    }
    
    
}
