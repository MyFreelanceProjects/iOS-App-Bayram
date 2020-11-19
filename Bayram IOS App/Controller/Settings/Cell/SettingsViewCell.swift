//
//  SettingsViewCell.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/18/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class SettingsViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var thisView: UIView!
    @IBOutlet weak var `switch`: UISwitch!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        thisView.cornerRadius = 10
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "SettingsViewCell", bundle: .main)
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        NotificationCenter.default.post(name: NSNotification.Name("switchChanged"),
                                        object: nil,
                                        userInfo: ["selected": sender.isOn])
    }
}
