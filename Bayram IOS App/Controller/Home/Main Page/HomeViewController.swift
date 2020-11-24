//
//  HomeViewController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/8/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController {
    
    @IBOutlet weak var thisView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let homeViewCell = HomeTableViewCell()
 
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        tableView.register(UINib(nibName: Constants.ServicesMenuCell.nibName, bundle: nil), forCellReuseIdentifier: Constants.ServicesMenuCell.identifier)        
    }
    
}

// MARK: - Configure cell options
struct HomeCell {
    var name: String
    var icon: String
}

let services = [
    HomeCell(name: "Restaurant", icon: "restaurant"),
    HomeCell(name: "Bar", icon: "bar"),
    HomeCell(name: "Room Service", icon: "room"),
    HomeCell(name: "Cabana", icon: "cabana"),
    HomeCell(name: "House Keeping", icon: "house_keeping"),
    HomeCell(name: "Spa", icon: "spa"),
    HomeCell(name: "Events & Activities", icon: "events"),
    HomeCell(name: "Other Services", icon: "other_services")
]

// MARK: - DataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ServicesMenuCell.identifier, for: indexPath) as! HomeTableViewCell
        
        cell.icon.image = UIImage(named: services[indexPath.row].icon)
        cell.serviceName.text = services[indexPath.row].name
        return cell
    }
}

// MARK: - TableView Delegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selected = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selected, animated: false)
            
            performSegue(withIdentifier: "showRestaurant", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.backBarButtonItem = self.customBackButton
    }
}
