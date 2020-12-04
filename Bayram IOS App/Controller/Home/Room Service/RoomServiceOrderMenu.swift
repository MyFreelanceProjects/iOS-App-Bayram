//
//  RoomServiceOrderMenu.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/3/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class RoomServiceOrderMenu: UIViewController {
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MENU"
        
        tableView.rowHeight = 65
        tableView.register(MenuViewCell.nib(), forCellReuseIdentifier: "cell")
        
        doneButton.isHidden = true
    }
    @IBAction func doneButtonPressed(_ sender: UIButton) {
    }
}

let RoomServiceOrderMenuItems: [String] = ["Starter", "Soup", "Salads", "Starter", "Salads", "Soup"]

//MARK: - UITableViewDelegate, UITableViewDataSource

extension RoomServiceOrderMenu: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RoomServiceOrderMenuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuViewCell

        cell.label.text = RoomServiceOrderMenuItems[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showRoomServiceDetailView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.backBarButtonItem = self.customBackButton
        
        let destinationVC = segue.destination as! RoomServiceDetailView
        
        if let selected = tableView.indexPathForSelectedRow {
            destinationVC.codeTitle = RoomServiceOrderMenuItems[selected.row]
        }
    }
    
}

