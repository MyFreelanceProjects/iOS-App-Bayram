//
//  ServiceView5.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/2/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class ServiceView5: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Other Services 5".uppercased()
        
        tableView.rowHeight = 65
        tableView.register(MenuViewCell.nib(), forCellReuseIdentifier: "cell")
    }
}

let OtherSItems2: [String] = ["OS5- 1", "OS5- 2"]

//MARK: - UITableViewDelegate, UITableViewDataSource

extension ServiceView5: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OtherSItems2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuViewCell

        cell.label.text = OtherSItems2[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showService4", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.backBarButtonItem = self.customBackButton
        
        if let identifier = segue.identifier {
            if identifier == "showService4" {
                let destinationVC = segue.destination as! ServiceView4
                
                if let selected = tableView.indexPathForSelectedRow {
                    destinationVC.viewTitle = OtherSItems[selected.row]
                }
            }
        }
    }
    
}
