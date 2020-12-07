//
//  SportsAndActivitiesController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/5/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class SportsAndActivitiesController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SPORT and Activities".uppercased()
        
        tableView.rowHeight = 65
        tableView.register(MenuViewCell.nib(), forCellReuseIdentifier: "cell")
        
    }
}

let SportsAndActivitiesMenuItems: [String] = ["Sport 1", "Activity 1"]

//MARK: - UITableViewDelegate, UITableViewDataSource

extension SportsAndActivitiesController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SportsAndActivitiesMenuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuViewCell

        cell.label.text = SportsAndActivitiesMenuItems[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "showSportDetailController", sender: self)
        } else {
            performSegue(withIdentifier: "showActivityTable", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.backBarButtonItem = self.customBackButton
        
        if let identifier = segue.identifier {
            switch identifier {
                case "showSportDetailController":
                    let destinationVC = segue.destination as! SportDetailController
                    destinationVC.viewTitle = SportsAndActivitiesMenuItems[tableView.indexPathForSelectedRow!.row]
                
                case "showActivityTable":
                    let destinationVC = segue.destination as! ActivityTable
                    destinationVC.viewTitle = SportsAndActivitiesMenuItems[tableView.indexPathForSelectedRow!.row]
                
                default:
                    return
            }
        }
    }
    
}

