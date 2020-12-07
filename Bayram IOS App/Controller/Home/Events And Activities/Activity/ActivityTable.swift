//
//  ActivityTable.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/6/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class ActivityTable: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var viewTitle: String = "" {
        didSet {
            self.title = viewTitle
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(joinButtonPressed(_:)),
            name: NSNotification.Name("activityJoinPressed"),
            object: nil)
        
        tableView.rowHeight = 290
        tableView.register(ActivityCell.nib(), forCellReuseIdentifier: "cell")
    }
    
    @objc func joinButtonPressed(_ notification: NSNotification) {
        performSegue(withIdentifier: "showActivityJoin", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.backBarButtonItem = self.customBackButton
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension ActivityTable: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ActivityCell
        
        // configure cell
        
        return cell
    }
    
}
