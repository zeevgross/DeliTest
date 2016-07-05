//
//  BeefViewController.swift
//  DeliTest
//
//  Created by Zeev Gross on 26/06/2016.
//  Copyright © 2016 Zeev Gross. All rights reserved.
//

import UIKit

class BeefViewController: UITableViewController {
    
    
    var productItems = [productItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadSmapleitems()
        
        print ("table")
    }
    
    
    func loadSmapleitems(){
        
        let photo1 = UIImage(named: "tbone")!
        let item1 = productItem (name: "item1", photo: photo1, quantity: "1", weight: "0", comment: "item 111", helpNeeded: false)!
        let item2 = productItem (name: "item2", photo: photo1, quantity: "1", weight: "0", comment: "item 222", helpNeeded: false)!
        let item3 = productItem (name: "item3", photo: photo1, quantity: "1", weight: "0", comment: "item 333", helpNeeded: false)!
        productItems += [item1, item2, item3]

    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print ("viewWillAppear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

   override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        let count = productItems.count
        return count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "BeefTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! BeefTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let item = productItems[indexPath.row]
        
        cell.itemName.text = item.name
        cell.itemPhoto.image = item.photo
        cell.itemComment.text = item.comment
        
        return cell
    }
    
    @IBAction func unwindToItemList(sender: UIStoryboardSegue) {
        
            if let sourceViewController = sender.sourceViewController as? NewItemDetailView, item = sourceViewController.item {
        
               // Add a new meal.
            let newIndexPath = NSIndexPath(forRow: productItems.count, inSection: 0)
            productItems.append(item)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            
        }
    }
}
