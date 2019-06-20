//
//  DetailTripController.swift
//  NoobTour
//
//  Created by nguyen.trong.hieu on 6/20/19.
//  Copyright © 2019 noobfromandroid. All rights reserved.
//

import UIKit

class DetailTripController: UIViewController {
    private var arrSub = [DetailTrip]()
    
    @IBOutlet weak var tripDetailTableView: UITableView!
    
    @IBOutlet weak var tripDetailImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: TripDetailCell.ID, bundle: nil)
        tripDetailTableView.register(nib, forCellReuseIdentifier: TripDetailCell.ID)
        setupData()
    }
    
    private func setupData() {
        let subDetail1 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Người tạo chuyến đi", title2: "Nguyễn Văn Tuấn")
        let subDetail2 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Chi phí dự kiến", title2: "900.000 VNĐ")
        let subDetail3 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Chi phí thực tế", title2: "1.000.000 VNĐ")
        let subDetail4 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710272210625200.jpg", title1: "Phương tiện", title2: "Xe máy,xe đạp,ô tô")
        let subDetail5 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710272210625200.jpg", title1: "Thành viên", title2: "20 người")
        let subdDetail6 = DetailTrip(thumbnail: "https://dev-img.sportsbull.jp/banners/img2019030710254879793300.jpg", title1: "Quãng đường", title2: "600 Km")
        arrSub = [subDetail1, subDetail2, subDetail3, subDetail4, subDetail5, subdDetail6]
    }

}

extension DetailTripController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSub.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TripDetailCell.ID) as? TripDetailCell else {
            return UITableViewCell()
        }

        cell.tripImageView.sd_setImage(with: URL(string: arrSub[indexPath.row].thumbnail), placeholderImage: nil)
        cell.titleCreateTripLabel.text = arrSub[indexPath.row].title1
        cell.nameCreateTripLabel.text = arrSub[indexPath.row].title2
        return cell
    }
    
    
}
