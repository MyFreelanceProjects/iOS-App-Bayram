//
//  SettingsViewController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/18/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

struct MenuItems {
    let name: String?
    let image: UIImage?
}

private let menu: [MenuItems] = [
    MenuItems(name: "Language", image: UIImage(named: "material-language")),
    MenuItems(name: "Sounds", image: UIImage(named: "volume-down")),
    MenuItems(name: "Notification", image: UIImage(named: "Rectangle")),
]

class SettingsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
        tableView.register(SettingsViewCell.nib(), forCellReuseIdentifier: "settingsCell")
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.switchChanged(_:)),
                                                name: NSNotification.Name(rawValue: "switchChanged"),
                                                object: nil)
        
    }
    
    
    @objc func switchChanged(_ notification: NSNotification) {
        if let user_info = notification.userInfo as NSDictionary? {
            if let status = user_info["selected"] as? Bool {
                print(status)
                // change user info
                
            }
        }
    }

}

// This is test by Ulvi.

//MARK: - UITableViewDataSource and Delegate Methods
let alertService = AlertService()

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! SettingsViewCell
        
        cell.label.text = menu[indexPath.row].name
        
        if indexPath.row == 0 || indexPath.row == 1 {
            cell.img.image = menu[indexPath.row].image
            cell.switch.isHidden = true
        } else {
            cell.img.isHidden = true
            cell.switch.isOn = true
        }
        
        
        return cell
    }
    
}

//MARK: - UITableViewDelegate
extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        if indexPath.row == 0 {
            // language selecting
            let alert = alertService.getLanguageSelectAlert(setTitle: "Language", ButtonName: "Save") {
                print("selected")
            }
            present(alert, animated: true)
            
        } else if indexPath.row == 1 {
            // sounds selecting
            let alert = alertService.getSoundsSelector(setTitle: "Sounds") {
                print("sound selector")
            }
            
            present(alert, animated: true)
        }

    }
}
