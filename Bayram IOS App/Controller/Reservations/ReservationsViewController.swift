//
//  ReservationsViewController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/13/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class ReservationsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 300
    }
    
    @objc func getAction (_ sender: UIButton) {
        print(sender)
        print("sfddjskjkskdsjdkjskjdskj")
    }
    
}

extension ReservationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reservationCell", for: indexPath) as! ReservationCell
        
        cell.delegate = self
        
        
        return cell
    }
    
}

//MARK: - Cell Delegate
extension ReservationsViewController: ReservationCellDelegate {
    func editReservation(with label: UILabel) {
        print("edit pressed")
        print(label)
    }
    
    func cancelReservation(with label: UILabel) {
        print("cancel pressed")
    }
    
}
