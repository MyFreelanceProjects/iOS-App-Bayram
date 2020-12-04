//
//  RoomServiceDetailView.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/3/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class RoomServiceDetailView: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var codeTitle: String = "" {
        didSet {
            self.title = codeTitle
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 135
        tableView.register(RoomServiceDetailCell.nib(), forCellReuseIdentifier: "cell")
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension RoomServiceDetailView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RoomServiceDetailCell
        
        return cell
    }
    
}
