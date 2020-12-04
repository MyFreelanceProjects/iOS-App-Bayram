//
//  OtherSViewController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/2/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class OtherSViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Other Services".uppercased()
        
        tableView.rowHeight = 65
        tableView.register(MenuViewCell.nib(), forCellReuseIdentifier: "cell")
    }
}

let OtherSItems: [String] = ["OS1", "OS2", "OS3", "OS4", "OS5"]

//MARK: - UITableViewDelegate, UITableViewDataSource

extension OtherSViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OtherSItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuViewCell

        cell.label.text = OtherSItems[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            case 0:
                performSegue(withIdentifier: "showService1", sender: self)
            case 1:
                performSegue(withIdentifier: "showService2", sender: self)
            case 2:
                performSegue(withIdentifier: "showService3", sender: self)
            case 3:
                performSegue(withIdentifier: "showService4", sender: self)
            case 4:
                performSegue(withIdentifier: "showService5", sender: self)
            
            default:
                return
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.backBarButtonItem = self.customBackButton
        
        switch segue.identifier! {
            case "showService4":
                let destinationVC = segue.destination as! ServiceView4
            
                if let selected = tableView.indexPathForSelectedRow {
                    destinationVC.viewTitle = OtherSItems[selected.row]
                }
            default:
                return
        }
    }
    
}
