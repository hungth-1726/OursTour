//
//  TripDetail.swift
//  NoobTour
//
//  Created by nguyen.trong.hieu on 6/20/19.
//  Copyright © 2019 noobfromandroid. All rights reserved.
//

import Foundation

class DetailTrip {
    var thumbnail: String = ""
    var title1: String = ""
    var title2: String = ""
    
    init(thumbnail: String, title1: String, title2: String) {
        self.thumbnail = thumbnail
        self.title1 = title1
        self.title2 = title2
    }
}
