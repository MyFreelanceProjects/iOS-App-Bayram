//
//  ReservationModel.swift
//  Bayram IOS App
//
//  Created by Kanan`s Macbook Pro on 2/1/21.
//  Copyright © 2021 Kanan`s Macbook Pro. All rights reserved.
//

import Foundation

struct ReservationModel: Decodable {
    var table_count: String?
    var max_cabana_count: String?
    var reserved_till_date_time: String?
    var service_type: String?
    var child_count: String?
    var adult_count: String?
    var reserved_from_date_time:String?
    var service_id: String?
    var reservation_body: String?
    var cabana_count: String?
    var service_name: String?
    var is_request:String?
    var date_time: String?
    var user_id: String?
    var baby_count: String?
    var service_reservation_info:String?
    var is_join: String?
    var _id: String?
    var reserved_date_time: String?
}

//
//[
//  {
//    "table_count": null,
//    "max_cabana_count": null,
//    "reserved_till_date_time": null,
//    "service_type": "1",
//    "child_count": "0",
//    "adult_count": "2",
//    "reserved_from_date_time": null,
//    "service_id": "26",
//    "reservation_body": "I am going to be there at that time.",
//    "cabana_count": null,
//    "service_name": null,
//    "is_request": "0",
//    "date_time": "2021-02-01 21:54:03",
//    "user_id": "200051",
//    "baby_count": "0",
//    "service_reservation_info": null,
//    "is_join": "0",
//    "_id": "45",
//    "reserved_date_time": "2021-02-24 19:00:00"
//  }
//]
