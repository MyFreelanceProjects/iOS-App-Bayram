//
//  HomeViewController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/8/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var thisView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let homeViewCell = HomeTableViewCell()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        LocalizationManager().setCurrentBundle(forLanguage: "en")
        
//        let bundle = Bundle(path: Bundle.main.path(forResource: "en", ofType: "lproj")!)
//        print( NSLocalizedString("entertainment_header".localized(), tableName: "", bundle: bundle!, value: "", comment: "") )
        
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: self.customTitleFont]
        tableView.register(UINib(nibName: Constants.ServicesMenuCell.nibName, bundle: nil), forCellReuseIdentifier: Constants.ServicesMenuCell.identifier)        
    }
    
    @IBAction func weatherClicked(_ sender: UIBarButtonItem) {
        NotificationCenter.default.post(name: NSNotification.Name("sideMenuPressed"),
                                        object: nil,
                                        userInfo: ["sideMenuID": 5])
    }
    // new line codes from local
}

// MARK: - Configure cell options
struct HomeCell {
    var name: String
    var icon: String
}
let services = [
    HomeCell(name: "entertainment_header".localized(), icon: "restaurant"),
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
        cell.serviceName.font = self.customTextFonts(fontSize: 18)
        return cell
    }
}

// MARK: - TableView Delegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selected = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selected, animated: false)
            switch indexPath.row {
                case 0:
                    performSegue(withIdentifier: "showRestaurant", sender: self)
                case 1:
                    performSegue(withIdentifier: "showBar", sender: self)
                case 2:
                     performSegue(withIdentifier: "showRoomService", sender: self)
                case 3:
                    performSegue(withIdentifier: "showCabana", sender: self)
                case 4:
                     performSegue(withIdentifier: "showHouseKeeping", sender: self)
                case 5:
                     performSegue(withIdentifier: "showSpa", sender: self)
                case 6:
                     performSegue(withIdentifier: "showEventsAndActivities", sender: self)
                case 7:
                     performSegue(withIdentifier: "showOtherServices", sender: self)
                
                default:
                    break
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.backBarButtonItem = self.customBackButton
        if let selected = tableView.indexPathForSelectedRow {
            //
        }
    }
}
