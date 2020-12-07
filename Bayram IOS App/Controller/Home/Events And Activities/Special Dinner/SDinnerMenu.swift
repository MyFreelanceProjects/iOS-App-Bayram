//
//  SDinnerMenu.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/5/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class SDinnerMenu: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MENU"
        
        tableView.rowHeight = 65
        tableView.register(MenuViewCell.nib(), forCellReuseIdentifier: "cell")
    }
}

let SDinnerMenuItems: [String] = ["Starter", "Soup", "Salads", "Starter", "Soup"]

//MARK: - UITableViewDelegate, UITableViewDataSource

extension SDinnerMenu: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SDinnerMenuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuViewCell

        cell.label.text = SDinnerMenuItems[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationItem.backBarButtonItem = self.customBackButton
        
        // set codeDress Controller Parameters
        performSegue(withIdentifier: "SDinnerMenuDressCode", sender: self)
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? SDinnerDressCodeController {
            destinationVC.title = SDinnerMenuItems[tableView.indexPathForSelectedRow!.row]
        }
    }
}
