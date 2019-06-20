//
//  Trip.swift
//  NoobTour
//
//  Created by TheAnh on 6/16/19.
//  Copyright © 2019 noobfromandroid. All rights reserved.
//

import Foundation
import Firebase

struct Trip {
    
    var id: String
    var name: String
    var startDate: Timestamp
    var endDate: Timestamp
    var thumbnail: String
    
    init(id: String, name: String, startDate: Timestamp, endDate : Timestamp, thumbnail: String) {
        self.id = id
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
        self.thumbnail = thumbnail
    }
}
