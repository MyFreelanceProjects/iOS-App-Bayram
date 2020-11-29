//
//  ImageCollectionCell.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/23/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class ImageCollectionCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib() -> UINib {
        return UINib(nibName: "ImageCollectionCell", bundle: nil)
    }
}
