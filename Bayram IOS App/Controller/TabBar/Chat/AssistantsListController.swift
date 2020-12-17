//
//  AssistantsListController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/14/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class AssistantsListController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var topView: [UIView]!
    
    let alert = AlertService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Guest Assistants".uppercased()
        
        configureUI()
        tableView.register(AssistantCell.nib(), forCellReuseIdentifier: "cell")
    }
    
    func configureUI() {
        for v in topView {
            v.layer.cornerRadius = v.frame.size.width/2
        }
    }
}

//MARK: -
extension AssistantsListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AssistantCell
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertVC = alert.info(setUserName: "Giuseppe Verdi",
                                 setUserStatus: "Online",
                                 setButtonTitle: "Close",
                                 setTimeInterval: "08:00 - 16:00")
        
        present(alertVC, animated: true)
    }
}
