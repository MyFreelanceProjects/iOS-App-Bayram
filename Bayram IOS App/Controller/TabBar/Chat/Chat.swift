//
//  Chat.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/8/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class Chat: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}

//MARK: - extension Chat: UITableViewDataSource, UITableViewDelegate
extension Chat: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        cell.textLabel?.text = "FEdsjkkfwjdsjds"

        return cell
    }
    
}
