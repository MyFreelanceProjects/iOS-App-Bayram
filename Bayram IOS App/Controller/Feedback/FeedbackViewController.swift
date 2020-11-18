//
//  FeedbackViewController.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/17/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "FeedbackViewCell", bundle: .main), forCellReuseIdentifier: "feedbackCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailFeedback" {
            let vc = segue.destination as! DetailFeedbackController
        }
    }
}

//MARK: - UITableView DataSource and Delegate methods
extension FeedbackViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedbackCell", for: indexPath)
        
        
        return cell
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailFeedback", sender: self)
    }
}
