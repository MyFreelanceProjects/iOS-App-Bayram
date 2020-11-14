//
//  EditReservationCell.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/13/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class EditReservationCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    var type: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        if type == "date_year" {
            NotificationCenter.default.post(name: NSNotification.Name("setDate"), object: nil)
        } else if type == "time" {
            NotificationCenter.default.post(name: NSNotification.Name("setTime"), object: nil)
        } else if type == "person" {
            NotificationCenter.default.post(name: NSNotification.Name("setPerson"), object: nil)
        }
    }
    
}
