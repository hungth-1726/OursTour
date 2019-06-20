//
//  MainController.swift
//  NoobTour
//
//  Created by TheAnh on 6/10/19.
//  Copyright © 2019 noobfromandroid. All rights reserved.
//

import UIKit
import FirebaseFirestore

class MainController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    var trips = [Trip]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.isHidden = true
        // Register the table view cell class and its reuse id
        self.tableView.register(UINib(nibName: "TripTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "TripTableViewCell")
        
        // (optional) include this line if you want to remove the extra empty cell divider lines
        self.tableView.tableFooterView = UIView()
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
        
        let db = Firestore.firestore()
        db.collection("trip").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let docId = document.documentID
                    let name = document.get("name") as! String
                    let startDate = document.get("start_date") as! Timestamp
                    let endDate = document.get("end_date") as! Timestamp
                    let thumbnail = document.get("thumbnail") as! String
                    let trip = Trip(id : docId, name: name, startDate: startDate, endDate: endDate, thumbnail: thumbnail)
                    self.trips.append(trip)
                }
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell = (self.tableView.dequeueReusableCell(withIdentifier: "TripTableViewCell") as? TripTableViewCell)!
        if indexPath.row < trips.count {
            let item = trips[indexPath.row]
            cell.configCell(item)
        }
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tripDetailController = DetailTripController(nibName: "DetailTripController", bundle: nil)
        self.navigationController?.pushViewController(tripDetailController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300.0
    }
}
