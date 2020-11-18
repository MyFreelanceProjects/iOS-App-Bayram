//
//  UIView.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/17/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}


