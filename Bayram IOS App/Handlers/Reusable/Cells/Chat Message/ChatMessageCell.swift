//
//  ChatMessageCell.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/12/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    @IBOutlet weak var messageFrom: UILabel!
    @IBOutlet weak var messageBody: UILabel!
    @IBOutlet weak var messageBubble: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        messageBubble.dropShadowView(color: .black, opacity: 0.5, offSet: CGSize(width: 0, height: 4), radius: 3, scale: true)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ChatMessageCell", bundle: nil)
    }
}
