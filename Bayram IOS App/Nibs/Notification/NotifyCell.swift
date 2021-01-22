//
//  NotifyCell.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/10/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class NotifyCell: UITableViewCell {
    @IBOutlet weak var thisView: UIView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "NotifyCell", bundle: nil)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        thisView.customBorder = 0.5
        time.layer.addBorder(edge: .right, color: .black, thickness: 1)
    }
    
    @IBAction func moreButtonPressed(_ sender: UIButton) {
        print(":more info")
    }
    
}
