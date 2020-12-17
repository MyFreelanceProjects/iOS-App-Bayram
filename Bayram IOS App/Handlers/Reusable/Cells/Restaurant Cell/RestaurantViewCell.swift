//
//  RestaurantViewCell.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/22/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class RestaurantViewCell: UITableViewCell {
    @IBOutlet weak var thisView: UIView!
    @IBOutlet weak var thisImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var timeInterval: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var ratingValue: UILabel!
    
    
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
        
        thisView.cornerRadius = 5
        thisImage.cornerRadius = 5
        thisView.dropShadowView(color: .gray, opacity: 0.5, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "RestaurantViewCell", bundle: nil)
    }

}
