//
//  SwitchTableViewCell.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/30/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    @IBOutlet weak var thisView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var switchButton: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        thisView.customBorder = 0.3
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "SwitchTableViewCell", bundle: nil)
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {

        NotificationCenter.default.post(
            name: NSNotification.Name("houseK_repair_switch"),
            object: nil,
            userInfo: ["name": self.name.text]
        )
    }
}
