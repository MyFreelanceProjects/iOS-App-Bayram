//
//  Protocols.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 11/24/20.
//  Copyright © 2020 Kanan`s Macbook Pro. All rights reserved.
//

import Foundation

protocol ReservationDelegate {
    func addReservationSegue(withIdentifier: String)
    func showDressCode(type: String)
}
