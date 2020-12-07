//
//  EventsAndActivities.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/6/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class EventsAndActivitiesCell: UITableViewCell {
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
        
        thisView.dropShadowView(color: .black, opacity: 0.5, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "EventsAndActivitiesCell", bundle: nil)
    }
    
}
