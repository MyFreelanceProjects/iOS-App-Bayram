//
//  AddReservationSpecialDController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/5/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class AddReservationSDinnerController: UIViewController {
    
    var dateAndPersons = [
        "date" : "Date",
        "time" : "Time",
        "firstPerson" : "0",
        "secondPerson" : "0",
        "thirdPerson" : "0",
        "avaible_person": "21"
    ]
    
    @IBOutlet weak var tableView: UITableView!

    let alert = AlertService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "RESERVATION"
        
        NotificationCenter.default.addObserver(self,
                selector: #selector(setDate),
                name: NSNotification.Name("setDate"),
                object: nil)
        
        NotificationCenter.default.addObserver(self,
            selector: #selector(setTime),
            name: NSNotification.Name("setTime"),
            object: nil)
        
        NotificationCenter.default.addObserver(self,
            selector: #selector(setPerson),
            name: NSNotification.Name("setPerson"),
            object: nil)
        
        
        tableView.rowHeight = 50
        tableView.register(UINib(nibName: "EditReservationCell", bundle: nil), forCellReuseIdentifier: "times")
    }
    
    @objc func setDate() {
        // get alert action
        let alertVC = alert.getDate(title: "Select Date", ButtonName: "Save", dataMode: .date) { settedTime in
            
            
            self.dateAndPersons["date"] = "\(settedTime.date)".formattedDate
            self.tableView.reloadData()
        }
        present(alertVC, animated: true)
    }
    
    @objc func setTime() {
        // get alert action
        let alertVC = alert.getDate(title: "Select Time", ButtonName: "Save", dataMode: .time) { settedTime in
            print(settedTime.date)
            // executed this response: 2021-11-15 19:39:18 +0000
            
            self.dateAndPersons["time"] = "\(settedTime.date)".formatterTime
            // refresh tableView for changing label
            self.tableView.reloadData()
        }

        present(alertVC, animated: true)
    }
    
    @objc func setPerson() {
        // get alert action
        let alertVC = alert.addPerson(title: "Type person count", buttonName: "Ok") { (first, second, third) in
            self.dateAndPersons["firstPerson"] = first ?? "0"
            self.dateAndPersons["secondPerson"] = second ?? "0"
            self.dateAndPersons["thirdPerson"] = third ?? "0"
//            print(self.dataAndPersons["firstPerson"])
            self.tableView.reloadData()
        }
        
        present(alertVC, animated: true)
    }
}

//MARK: - TableView DataSource
extension AddReservationSDinnerController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "times", for: indexPath) as! EditReservationCell
        cell.avaible_place.isHidden = true
        switch indexPath.row {
            case 0:
                cell.type = "date_year"
                cell.icon.image = UIImage(named: "date-range")
                cell.label.text = dateAndPersons["date"]
            case 1:
                cell.avaible_place.isHidden = false
                cell.type = "avaible_person"
                cell.icon.image = UIImage(named: "accounting")
                cell.label.text = "Available places:"
                cell.avaible_place.text = dateAndPersons["avaible_person"]
            case 2:
                cell.type = "time"
                cell.icon.image = UIImage(named: "access-time")
                cell.label.text = dateAndPersons["time"]
            case 3:
                cell.type = "person"
                cell.icon.image = UIImage(named: "calculator")
                cell.label.text = "\(dateAndPersons["firstPerson"] ?? "0") + \(dateAndPersons["secondPerson"] ?? "0") + \(dateAndPersons["thirdPerson"] ?? "0")"
            
        default:
            return cell
        }
        
        return cell
    }
    
}
