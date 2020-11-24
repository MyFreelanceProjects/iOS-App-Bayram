//
//  UICollectionViewCell.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/23/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
          layer.masksToBounds = false
          layer.shadowColor = color.cgColor
          layer.shadowOpacity = opacity
          layer.shadowOffset = offSet
          layer.shadowRadius = radius
        
          layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
          layer.shouldRasterize = true
          layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
