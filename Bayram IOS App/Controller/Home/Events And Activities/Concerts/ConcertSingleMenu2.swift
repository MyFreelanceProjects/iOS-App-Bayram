//
//  ConcertSingleMenu2.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/6/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class ConcertSingleMenu2: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MENU"
        
        tableView.rowHeight = 65
        tableView.register(MenuViewCell.nib(), forCellReuseIdentifier: "cell")
    }
}

let ConcertSingleMenuItems2: [String] = ["Starter", "Soup", "Starter"]

//MARK: - UITableViewDelegate, UITableViewDataSource

extension ConcertSingleMenu2: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ConcertSingleMenuItems2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuViewCell

        cell.label.text = ConcertSingleMenuItems2[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showConcertDressCode", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.backBarButtonItem = self.customBackButton
        
        if let identifier = segue.identifier {
            switch identifier {
                case "showConcertDressCode":
                    let destinationVC = segue.destination as! ConcertDressCode
                    destinationVC.codeTitle = ConcertSingleMenuItems2[tableView.indexPathForSelectedRow!.row]
                
                default:
                    return
            }
        }
        
    }
    
}


