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
    
    private var reservationArray: [ReservationModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 300
        
        select_my_reservations()
    }
    
    func select_my_reservations() {
        self.view.makeToastActivity(.center)
        
        GettingUserDataFromManager.sharedInstance.decodeUserInfo { (user_data) -> Void in
            if let user_data = user_data {
                if  let auth_token = user_data.auth_token,
                    let user_id    = user_data._id,
                    let lang_index  = self.lang_index {
                    
                    let params: [String: String] = [
                        "auth_token" : auth_token,
                        "user_id"    : user_id,
                        "lang_index" : lang_index
                    ]
                    
                    // api calling for getting all reservation list
                    ReservationManager.shared.select_my_reservations(endpoint: "/select_my_reservations.php", params: params) { result in
                        // handling result
                        switch result {
                        case .success(let json):
                            let decoder = JSONDecoder()
                            do {
                                let array = try json.rawData()
                                
                                let arrayOfReservation = try decoder.decode([ReservationModel].self, from: array)
                                self.writeDataToScene(with: arrayOfReservation)
                            } catch {
                                print("error")
                            }
                            
                        case.failure(let error):
                            print(error)
                            self.view.makeToast("\(error)")
                        }
                        
                        self.view.hideToastActivity()
                    }
                }
            }
        }
    }
    
    private func writeDataToScene(with arrayOfReservation: [ReservationModel]) {
        reservationArray = arrayOfReservation
        tableView.reloadData()
    }
    
    @objc func getAction (_ sender: UIButton) {
        print(sender)
        print("sfddjskjkskdsjdkjskjdskj")
    }
    
}

extension ReservationsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reservationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reservationCell", for: indexPath) as! ReservationCell

        cell.delegate = self
        cell.bodyText.text = reservationArray[indexPath.row].reservation_body
        cell.date.text = reservationArray[indexPath.row].date_time

        cell.people.text =
                "\(reservationArray[indexPath.row].adult_count!) + \(reservationArray[indexPath.row].child_count!) + \(reservationArray[indexPath.row].baby_count!) persons"
        
        cell.label.text = reservationArray[indexPath.row].service_name
        cell.expirationTime.text = reservationArray[indexPath.row].reserved_date_time
        

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
