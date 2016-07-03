//
//  ItemCollectionViewController.swift
//  DeliTest
//
//  Created by Zeev Gross on 29/06/2016.
//  Copyright © 2016 Zeev Gross. All rights reserved.
//

import UIKit

class ItemCollectionViewController : UICollectionViewController {
    
    
    var tableData: [String] = ["T-Bone", "Gound Beef", "Fillet","Osso Bucco"]
    var tableImages: [String] = ["tbone", "ground", "fillet", "osobucco"]

    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableData.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: ItemCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("ItemCollectionViewCell", forIndexPath: indexPath) as! ItemCollectionViewCell
        cell.itemName.text = tableData[indexPath.row]
        cell.itemImage.image = UIImage(named: tableImages[indexPath.row])
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("Cell \(indexPath.row) selected")
    }
    

    
    
    
    
}