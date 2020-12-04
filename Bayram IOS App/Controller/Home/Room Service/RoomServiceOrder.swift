//
//  RoomServiceOrder.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/3/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class RoomServiceOrder: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var finishOrderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ORDER"
        
        tableView.rowHeight = 65
        tableView.register(MenuViewCell.nib(), forCellReuseIdentifier: "cell")
        
    }
    @IBAction func finishOrderButtonPressed(_ sender: UIButton) {
        // get detail page
        performSegue(withIdentifier: "showRoomServiceFinishOrder", sender: self)
    }
    
}

let RoomServiceMenuItems: [String] = ["Food", "Beverages", "Wine", "Other"]

//MARK: - UITableViewDelegate, UITableViewDataSource

extension RoomServiceOrder: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RoomServiceMenuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuViewCell

        cell.label.text = RoomServiceMenuItems[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "showRoomServiceOrderMenu", sender: self)
        } else {
            performSegue(withIdentifier: "showRoomServiceDetailView", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.backBarButtonItem = self.customBackButton
        
        if segue.identifier! == "showRoomServiceOrderMenu" {
            
        }
        else if segue.identifier! == "showRoomServiceDetailView" {
            let destinationVC = segue.destination as! RoomServiceDetailView
            
            if let selected = tableView.indexPathForSelectedRow {
                destinationVC.codeTitle = RoomServiceMenuItems[selected.row]
            }
        }
    }
    
}
