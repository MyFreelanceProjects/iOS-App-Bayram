//
//  ReservationDetailCell_1.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/22/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class ReservationDetailCell_1: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var thisView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        thisView.cornerRadius = 5
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ReservationDetailCell_1", bundle: nil)
    }
}
