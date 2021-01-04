//
//  EntertainmentsController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/5/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class EntertainmentsController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ENTERTAINMENT"
        
        tableView.rowHeight = 65
        tableView.register(MenuViewCell.nib(), forCellReuseIdentifier: "cell")
    }
}

let EntertainmentsControllerMenuItems: [String] = ["Concerts", "Sport & Activities", "Special Dinner"]

//MARK: - UITableViewDelegate, UITableViewDataSource

extension EntertainmentsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntertainmentsControllerMenuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuViewCell

        cell.label.text = EntertainmentsControllerMenuItems[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            case 0:
                 performSegue(withIdentifier: "showConcertsMenuController", sender: self)
            
            case 1:
                performSegue(withIdentifier: "showSportsAndActivitiesController", sender: self)
            
            case 2:
                performSegue(withIdentifier: "showSpecialDinnerTableController", sender: self)
            
            default:
                return
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.backBarButtonItem = self.customBackButton
        
        
    }
    
}

