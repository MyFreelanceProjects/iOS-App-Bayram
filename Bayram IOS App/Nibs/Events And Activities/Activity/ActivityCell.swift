//
//  ActivityCell.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/6/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class ActivityCell: UITableViewCell {

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
        
        thisView.customShadow()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ActivityCell", bundle: nil)
    }
    
    @IBAction func joinPressed(_ sender: UIButton) {
        NotificationCenter.default.post(
            name: NSNotification.Name("activityJoinPressed"),
            object: nil
        )
    }
}
