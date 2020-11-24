//
//  ReservationDetailCell_2.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/22/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class ReservationDetailCell_2: UICollectionViewCell {
    @IBOutlet weak var thisView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        thisView.customBorder = 0.2
    }

    static func nib() -> UINib {
        return UINib(nibName: "ReservationDetailCell_2", bundle: nil)
    }
}
