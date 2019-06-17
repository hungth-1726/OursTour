//
//  TripTableViewCell.swift
//  NoobTour
//
//  Created by TheAnh on 6/16/19.
//  Copyright © 2019 noobfromandroid. All rights reserved.
//

import UIKit
import SDWebImage

class TripTableViewCell: UITableViewCell {

    @IBOutlet weak var textName: UILabel!
    
    @IBOutlet weak var startDate: UILabel!

    @IBOutlet weak var endDate: UILabel!

    @IBOutlet weak var thumbnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(_ item: Trip) {
        textName.text = item.name
        startDate.text = self.getReadableDate(date :item.startDate.dateValue())
        endDate.text = self.getReadableDate(date : item.endDate.dateValue())
        thumbnail.sd_setImage(with: URL(string: item.thumbnail), placeholderImage: UIImage(named:"placeholder.jpg"))
    }
    
    func getReadableDate(date: Date) -> String? {
        let dateFormatter = DateFormatter()
        
        if Calendar.current.isDateInTomorrow(date) {
            return "Tomorrow"
        } else if Calendar.current.isDateInYesterday(date) {
            return "Yesterday"
        } else if dateFallsInCurrentWeek(date: date) {
            if Calendar.current.isDateInToday(date) {
                dateFormatter.dateFormat = "h:mm a"
                return dateFormatter.string(from: date)
            } else {
                dateFormatter.dateFormat = "EEEE"
                return dateFormatter.string(from: date)
            }
        } else {
            dateFormatter.dateFormat = "MMM d, yyyy"
            return dateFormatter.string(from: date)
        }
    }
    
    func dateFallsInCurrentWeek(date: Date) -> Bool {
        let currentWeek = Calendar.current.component(Calendar.Component.weekOfYear, from: Date())
        let datesWeek = Calendar.current.component(Calendar.Component.weekOfYear, from: date)
        return (currentWeek == datesWeek)
    }
}
