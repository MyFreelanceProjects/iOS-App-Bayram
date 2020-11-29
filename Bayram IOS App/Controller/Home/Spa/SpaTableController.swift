//
//  SpaTableController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/28/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class SpaTableController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SPA"
        
        tableView.rowHeight = 60
        tableView.register(MenuViewCell2.nib(), forCellReuseIdentifier: "cell")
    }
    
}

let menuItems2 = ["Spa1", "Spa2", "Spa3", "Spa4", "Spa5"]
//MARK: - UITableViewDelegate, UITableViewDataSource

extension SpaTableController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuViewCell2

        cell.label.text = menuItems2[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showSpaDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.backBarButtonItem = self.customBackButton
        
        if let selected = tableView.indexPathForSelectedRow {
            let destinationVC = segue.destination as! SpaReservationDetailController
            destinationVC.navigationItem.title = menuItems2[selected.row]
            
        }
    }
    
}

