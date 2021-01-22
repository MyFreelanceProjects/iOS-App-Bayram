//
//  RoomServiceDetailCell.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/4/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class RoomServiceDetailCell: UITableViewCell {
    @IBOutlet weak var thisView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var bodyText: UILabel!
    
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
        priceView.customShadow()
        count.customShadow()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "RoomServiceDetailCell", bundle: nil)
    }
    
    @IBAction func minusPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func plusPressed(_ sender: UIButton) {
    }
}
