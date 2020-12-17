//
//  Chat.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/8/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class Chat: UIViewController {
    @IBOutlet weak var searchBubble: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendIcon: UIButton!
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var soundIcon: UIButton!
    @IBOutlet weak var smileButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableViewUI()
        configureMessageBubble()
        addingActionToNavigationTitle()
    }
    
    func addingActionToNavigationTitle() {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        button.addTarget(self, action: #selector(titleClicked), for: .touchUpInside)
        button.setTitle("Guest Assistant", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .red
        
        navigationItem.titleView = button
    }
    
    @objc func titleClicked() {
        performSegue(withIdentifier: "showAssistantsListController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.backBarButtonItem = self.customBackButton
        
    }
    
    func configureMessageBubble() {
        searchBubble.customBorder = 0.3
        sendIcon.isHidden = true
        soundIcon.layer.addBorder(edge: .left, color: .gray, thickness: 0.5)
        messageField.borderStyle = .none
    }
    
    func configureTableViewUI() {
        tableView.register(ChatMessageCell.nib(), forCellReuseIdentifier: "cell")
        
    }
}

//MARK: - extension Chat: UITableViewDataSource, UITableViewDelegate
extension Chat: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChatMessageCell
        

        return cell
    }
    
}

//MARK: - UITextFieldDelegate
extension Chat: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text!.count > 0 {
            soundIcon.isHidden = true
            sendIcon.isHidden = false
            
        } else {
            soundIcon.isHidden = false
            sendIcon.isHidden = true
        }
    }
    
}
