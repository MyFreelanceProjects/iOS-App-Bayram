//
//  SwitchTableViewCell2.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 12/1/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

class SwitchTableViewCell2: UITableViewCell {
    @IBOutlet weak var thisView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var count: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        thisView.customBorder = 0.3
        count.customBorder = 0.3
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "SwitchTableViewCell2", bundle: nil)
    }
    
    @IBAction func plusPressed(_ sender: UIButton) {
        let n = Int(self.count!.text!)! + 1
        self.count.text = String("\(n)")
        
        NotificationCenter.default.post(name: NSNotification.Name("HouseK_necessaryStepper"),
                                        object: nil,
                                        userInfo: ["count": n])
    }
    
    @IBAction func minusPressed(_ sender: UIButton) {
        let n = Int(self.count!.text!)! - 1
        
        if n >= 0 {
            self.count.text = String("\(n)")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("HouseK_necessaryStepper"),
            object: nil,
            userInfo: ["count": n])
    }
}
