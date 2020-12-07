//
//  ConcertSingleMenu.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/6/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class ConcertSingleMenu: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MENU"
        
        tableView.rowHeight = 65
        tableView.register(MenuViewCell.nib(), forCellReuseIdentifier: "cell")
    }
}

let ConcertSingleMenuItems: [String] = ["Food", "Beverages", "Wine", "Other"]

//MARK: - UITableViewDelegate, UITableViewDataSource

extension ConcertSingleMenu: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ConcertSingleMenuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuViewCell

        cell.label.text = ConcertSingleMenuItems[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "showConcertSingleMenu2", sender: self)
        } else {
            performSegue(withIdentifier: "showConcertDressCode", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.backBarButtonItem = self.customBackButton
        
        if let identifier = segue.identifier {
            switch identifier {
                case "showConcertDressCode":
                    let destinationVC = segue.destination as! ConcertDressCode
                    destinationVC.codeTitle = ConcertSingleMenuItems[tableView.indexPathForSelectedRow!.row]
                
                default:
                    return
            }
        }
        
    }
    
}
