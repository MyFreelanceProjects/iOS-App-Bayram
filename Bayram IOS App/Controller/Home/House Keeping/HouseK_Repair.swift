//
//  HouseK_Repair.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/30/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class HouseK_Repair: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var finishOrder: UIButton!
    
    let alert = AlertService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Repair".uppercased()
        
        finishOrder.isHidden = true

        tableView.rowHeight = 55
        tableView.register(SwitchTableViewCell.nib(), forCellReuseIdentifier: "cell")
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(switchChanged(_:)),
            name: NSNotification.Name("houseK_repair_switch"),
            object: nil)
        
    }
    
    @objc func switchChanged(_ notification: NSNotification) {
        print(notification.userInfo!["name"])
        if let user_info = notification.userInfo as NSDictionary? {
            if let name = user_info["name"] as? String {
                finishOrder.isHidden = false
            }
        }
    }
    
    @IBAction func finishOrderPressed(_ sender: UIButton) {
        let alertVC = alert.info(bodyText: "Thanks you! We will fulfill your order as soon as possible.", buttonTitle: "CLOSE")
        
        present(alertVC, animated: true)
        
        finishOrder.isHidden = true
    }
    
}

struct HouseKeepingDataStruct {
    let name: String
    let price: String
}

let HouseKeepingData: [HouseKeepingDataStruct] = [
    HouseKeepingDataStruct(name: "Selective one", price: "$12"),
    HouseKeepingDataStruct(name: "Selective two", price: "$4"),
    HouseKeepingDataStruct(name: "Selective three", price: "$9"),
    HouseKeepingDataStruct(name: "Selective four", price: "$17"),
    HouseKeepingDataStruct(name: "Selective five", price: "$23"),
    HouseKeepingDataStruct(name: "Selective six", price: "$4"),
]
//MARK: - UITableViewDelegate, UITableViewDataSource

extension HouseK_Repair: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HouseKeepingData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SwitchTableViewCell
        
        cell.name.text = HouseKeepingData[indexPath.row].name
        cell.price.text = HouseKeepingData[indexPath.row].price
        
        return cell
    }
    
    
}
