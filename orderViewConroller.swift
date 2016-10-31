//
//  orderViewConroller.swift
//  DeliTest
//
//  Created by Zeev Gross on 30/10/2016.
//  Copyright © 2016 Zeev Gross. All rights reserved.
//

import UIKit

class orderViewController: UITableViewController {
    
    
    var order = CustomerOrder(mail: "zeev.gross.work@gmail.com", store: "8888")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Load the data
        order!.pollOrderStatusRequest(order!.orderResponseTest)
        order!.simResponse()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = order!.orderTracking.count
        return count
    }
    
    // Override to support editing the table view.
    
    
    func toDateTime(strDate: String) -> NSDate
    {
        //Create Date Formatter
        let dateFormatter = NSDateFormatter()
        
        //Specify Format of String to Parse
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        
        //Parse into NSDate
        let dateFromString : NSDate = dateFormatter.dateFromString(strDate)!
        
        //Return Parsed Date
        return dateFromString
    }

    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "orderTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! orderTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let deliOrder = order!.orderTracking[indexPath.row]
      /*
        cell.itemName.text = item.name
        cell.itemPhoto.image = item.photo
        cell.itemComment.text = item.comment
      */
        
        
        let orderCurrentDate: String = "29-10-2016 14:05:42"
        
        let s1: NSDate = toDateTime(deliOrder.startTime)
        let s2: NSDate = toDateTime(deliOrder.estimedTime)
        let c1: NSDate = toDateTime(orderCurrentDate)
        
        let interval = s2.timeIntervalSinceDate(s1)
        let intervalText: String = String(Int(interval/60)) + ":" + String(format: "%02d", Int(interval%60))
        
        // calc Progress bar
        
        let ratio = c1.timeIntervalSinceDate(s1) / interval
        
        cell.deliName.text = deliOrder.deliName
        cell.progrssBar.progress = Float(ratio)
        cell.timeValue.text = intervalText
        cell.photo.image = deliImage(deliOrder.deliName)
        
        return cell
    }
    
    func deliImage(deliName: String) ->UIImage {
        
        var imageName:String = ""
        
        switch deliName {
        
        case "Beef":
            imageName = "BeefDeli"
        case "Fish":
            imageName = "FishDeli"
        case "Chease":
            imageName = "CheaseDeli"

        default:
            imageName = ""
        }
        
        return UIImage(named: imageName)!
    }
    
}
