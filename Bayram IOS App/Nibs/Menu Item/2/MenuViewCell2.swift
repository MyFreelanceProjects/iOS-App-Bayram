//
//  MenuViewCell2.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/28/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class MenuViewCell2: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var thisView: UIView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        thisView.cornerRadius = 10
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MenuViewCell2", bundle: nil)
    }
}
