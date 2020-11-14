//
//  ReservationCell.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/13/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import UIKit

protocol ReservationCellDelegate {
    func editReservation(with: UILabel)
    func cancelReservation(with: UILabel)
}

class ReservationCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var bodyText: UILabel!
    
    @IBOutlet weak var expirationTime: UILabel!
    @IBOutlet weak var people: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var delegate: ReservationCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        layoutMargins = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    }
    
    
    @IBAction func editPressed(_ label: UILabel) {
        delegate?.editReservation(with: self.label)
    }
    
    @IBAction func cancelPressed(_ label: UILabel) {
        delegate?.cancelReservation(with: self.label)
    }
}
