//
//  TripDetailCell.swift
//  NoobTour
//
//  Created by nguyen.trong.hieu on 6/20/19.
//  Copyright © 2019 noobfromandroid. All rights reserved.
//

import UIKit

class TripDetailCell: UITableViewCell {

    @IBOutlet weak var tripImageView: UIImageView!
    
    @IBOutlet weak var titleCreateTripLabel: UILabel!
    
    @IBOutlet weak var nameCreateTripLabel: UILabel!
    static let ID = "TripDetailCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
