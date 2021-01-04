//
//  RoomServiceFinishOrder.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/4/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class RoomServiceFinishOrder: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var orderView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details of order".uppercased()
     
        tableView.rowHeight = 45
        tableView.register(RoomServiceCell.nib(), forCellReuseIdentifier: "cell")
        
        configureUI()
    }
    
    func configureUI() {
        topView.customShadow()
        orderView.customShadow()
    }
}

//MARK: -

extension RoomServiceFinishOrder: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RoomServiceCell
        
        
        return cell
    }
    
    
}
