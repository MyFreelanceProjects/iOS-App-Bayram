//
//  CALayer.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/27/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

extension CALayer {

    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {

        let border = CALayer()

        switch edge {
            case UIRectEdge.top:
                border.frame = CGRect(x: 0, y: 0, width: self.frame.height, height: thickness)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: UIScreen.main.bounds.width, height: thickness)
                break
            case UIRectEdge.left:
                border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)
                break
            default:
                break
        }

        border.backgroundColor = color.cgColor;

        self.addSublayer(border)
    }
    
    func setCustomFontFamily(name: String, size: CGFloat) -> UIFont {
        return UIFont(name: name, size: size)!
    }

}
