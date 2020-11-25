//
//  RestaurantMenu.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/25/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class RestaurantMenu: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MENU"
        
        tableView.rowHeight = 65
        tableView.register(MenuViewCell.nib(), forCellReuseIdentifier: "cell")
    }
}

let RestaurantMenuItems: [String] = ["Starter", "Soup", "Salads", "Starter", "Soup"]

//MARK: - UITableViewDelegate, UITableViewDataSource

extension RestaurantMenu: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RestaurantMenuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuViewCell

        cell.label.text = RestaurantMenuItems[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationItem.backBarButtonItem = self.customBackButton
        
        // set codeDress Controller Parameters
        performSegue(withIdentifier: "RestaurantMenuDressCode", sender: self)
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ResDressCodeController {
            destinationVC.title = RestaurantMenuItems[tableView.indexPathForSelectedRow!.row]
        }
    }
}
