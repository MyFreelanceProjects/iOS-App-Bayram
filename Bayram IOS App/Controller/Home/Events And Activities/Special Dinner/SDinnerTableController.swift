//
//  SDinnerTableController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/5/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class SDinnerTableController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SPECIAL DINNER"

        self.navigationItem.backBarButtonItem = self.customBackButton
        
        tableView.register(RestaurantViewCell.nib(), forCellReuseIdentifier: "cell")
    }
    
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension SDinnerTableController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RestaurantViewCell

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showSDinnerDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.backBarButtonItem = self.customBackButton
        
        if let selected = tableView.indexPathForSelectedRow {
            
        }
    }
    
}
