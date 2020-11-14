//
//  AccountViewController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/11/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var leftTableView: UITableView!
    @IBOutlet weak var rightTableView: UITableView!
    
    let alertService = AlertService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftTableView.register(UINib(nibName: "LeftTableCell", bundle: .main), forCellReuseIdentifier: "check_in")
        
        rightTableView.register(UINib(nibName: "RightTableCell", bundle: .main), forCellReuseIdentifier: "check_out")

    }
    
    //MARK: - Buttons Pressed
    @IBAction func AboutButtonPressed(_ sender: UIButton) {
        let alert = alertService.info(
                                    bodyText: "\"Guest Assistant\" is hotel-guest POS and management system...",
                                    buttonTitle: "Close")
        
        present(alert, animated: true)
    }
    
    @IBAction func rateAppButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func signOutPressed(_ sender: UIButton) {
    }
}




//MARK: - Table Cell
extension AccountViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == leftTableView ? 2 : 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // check cell
        if tableView == leftTableView {
            let cell = leftTableView.dequeueReusableCell(withIdentifier: "check_in", for: indexPath) as! LeftTableCell
            
            // add each value
            cell.label.text = indexPath.row == 0 ? "CHECK-IN" : "CHECK-OUT"
            cell.icon.image = indexPath.row == 0 ? UIImage(named: "check-in") : UIImage(named: "check-out")
            
            return cell
        }
        else if tableView == rightTableView {
            let cell = rightTableView.dequeueReusableCell(withIdentifier: "check_out", for: indexPath) as! RightTableCell
            print(indexPath.row)
            var textValue: String? = nil
            
            // add each value
            switch indexPath.row {
                case 0:
                    cell.icon.image = UIImage(named: "metro-home-account")
                    textValue = "Room: 411"
                case 1:
                    cell.icon.image = UIImage(named: "metro-calculator")
                    textValue = "Count: 2+2"
                case 2:
                    cell.icon.image = UIImage(named: "feather-star")
                    textValue = "Class: Suit"
            default:
                textValue = "unknown"
            }
            cell.label.text = textValue
            return cell
        }
        
        return UITableViewCell()

    }
    
}
