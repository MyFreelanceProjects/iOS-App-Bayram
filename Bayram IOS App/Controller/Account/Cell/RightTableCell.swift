//
//  RightTableCell.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/12/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class RightTableCell: UITableViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
