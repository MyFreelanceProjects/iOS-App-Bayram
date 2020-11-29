//
//  BarTableController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/26/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class BarTableController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "BAR"
        
        tableView.register(RestaurantViewCell.nib(), forCellReuseIdentifier: "cell")
    }
    
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension BarTableController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RestaurantViewCell

        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showBarDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.backBarButtonItem = self.customBackButton
        
        if let selected = tableView.indexPathForSelectedRow {
//            let destinationVC = segue.destination as! BarTableController
//
//            destinationVC.selectedRow = menuItems[selected.row]
            
        }
    }
    
}
