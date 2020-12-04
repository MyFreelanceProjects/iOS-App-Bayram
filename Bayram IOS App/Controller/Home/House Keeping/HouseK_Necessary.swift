//
//  HouseK_Necessary.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/1/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class HouseK_Necessary: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var finishOrder: UIButton!
    
    let alert = AlertService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cleaning".uppercased()
        
        finishOrder.isHidden = true

        tableView.rowHeight = 65
        tableView.register(SwitchTableViewCell2.nib(), forCellReuseIdentifier: "cell")
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(switchChanged(_:)),
            name: NSNotification.Name("HouseK_necessaryStepper"),
            object: nil)
        
    }
    
    @objc func switchChanged(_ notification: NSNotification) {
        if let user_info = notification.userInfo as NSDictionary? {
            if let count = user_info["count"] as? Int {
                print(count)
                if count > 0 {
                    finishOrder.isHidden = false
                }
            }
        }
    }
    
    @IBAction func finishOrderPressed(_ sender: UIButton) {
        let time3 = Time(startHour: 0, intervalMinutes: 30, endHour: 24)
        let ranges3 = time3.timeRepresentations.enumerated().compactMap { index, value -> String? in
            if index + 1 < time3.timeRepresentations.count {

                return value + " - " + time3.timeRepresentations[index + 1]
            }
            return nil
        }
        
        
        let alertVC = alert.info(bodyText: "Thanks you! We will fulfill your order as soon as possible.", buttonTitle: "Close".uppercased()) // :)
        
        present(alertVC, animated: true)
        
        self.finishOrder.isHidden = true
    }
    
}

let HouseK_CleaningData2: [HouseKeepingDataStruct] = [
    HouseKeepingDataStruct(name: "Selective one", price: "$12"),
    HouseKeepingDataStruct(name: "Selective two", price: "$4"),
    HouseKeepingDataStruct(name: "Selective three", price: "$9"),
    HouseKeepingDataStruct(name: "Selective four", price: "$17"),
    HouseKeepingDataStruct(name: "Selective five", price: "$23"),
    HouseKeepingDataStruct(name: "Selective six", price: "$4"),
]
//MARK: - UITableViewDelegate, UITableViewDataSource

extension HouseK_Necessary: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HouseK_CleaningData2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SwitchTableViewCell2
        
        cell.name.text = HouseK_CleaningData2[indexPath.row].name
        cell.count.text = "0"
        
        return cell
    }
    
    
}
