//
//  FeedbackViewCell.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/17/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit
import Cosmos


class FeedbackViewCell: UITableViewCell {
    @IBOutlet weak var feedbackTitle: UILabel!
    @IBOutlet weak var feedbackDate: UILabel!
    @IBOutlet weak var firstStar: CosmosView!
    @IBOutlet weak var secondStar: CosmosView!
    @IBOutlet weak var bodyText: UILabel!
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
    
}
