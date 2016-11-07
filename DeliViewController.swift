//
//  DeliViewController.swift
//  DeliTest
//
//  Created by Zeev Gross on 03/11/2016.
//  Copyright © 2016 Zeev Gross. All rights reserved.
//

import UIKit

class DeliViewController: UITableViewController {
    
    
    var productItems = [productItem]()
    var deliName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem()
        
        
        //TODO - change to current order
        
        if let savedItemss = loadItems() {
            productItems += savedItemss
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        //TODO - change to current order
        
        let count = productItems.count
        return count
    }
    
    // Override to support editing the table view.
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            // Delete the row from the data source
            
            productItems.removeAtIndex(indexPath.row)
            saveItems()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        else if editingStyle == .Insert {
            
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "BeefTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! BeefTableViewCell
        
        //TODO - change to current order
        
        // Fetches the appropriate meal for the data source layout.
        let item = productItems[indexPath.row]
        
        cell.itemName.text = item.name
        cell.itemPhoto.image = item.photo
        cell.itemComment.text = item.comment
        
        return cell
    }
    
    @IBAction func unwindToItemList(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.sourceViewController as? NewItemDetailView, item = sourceViewController.item {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing meal.
                
                productItems[selectedIndexPath.row] = item
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            }
            else
            {
                
                // Add a new item
                
                let newIndexPath = NSIndexPath(forRow: productItems.count, inSection: 0)
                productItems.append(item)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
        }
        
        // Save the items
        saveItems()
        //buldJsonOrder()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier  == "showDetail"{
            
            let newItemViewController = segue.destinationViewController as! NewItemDetailView
            
            // Get the cell that generated this segue
            
            if let selectedItemCell = sender as? BeefTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedItemCell)!
                let selectedMeal = productItems[indexPath.row]
                newItemViewController.item = selectedMeal
            }
        }
        if segue.identifier == "addPressed"
        {
            
            let newItemCollectionview = segue.destinationViewController as! ItemCollectionViewController
            
            newItemCollectionview.deliName = deliName
            
        }
        
    }
    
    
    // MARK: NSCoding
    
    func saveItems() {
        
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(productItems, toFile: productItem.ArchiveURL.path!)
        
        if !isSuccessfulSave {
            print("Failed to save items...")
        }
    }
    
    func loadItems() -> [productItem]? {
        
        return NSKeyedUnarchiver.unarchiveObjectWithFile(productItem.ArchiveURL.path!) as? [productItem]
        
    }
   
}
