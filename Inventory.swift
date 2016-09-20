//
//  Inventory.swift
//  DeliTest
//
//  Created by Zeev Gross on 18/09/2016.
//  Copyright © 2016 Zeev Gross. All rights reserved.
//

import UIKit

class inventory: NSObject  {
    
    // MARK: Properties
    
    var itemId: Int32
    var name: String
    var photo: UIImage?
    
    // MARK: Initialization
    
    init?(itemId: Int32,name: String, photo: UIImage?){
        
        // Initialize stored properties.
        self.itemId = itemId
        self.name = name
        self.photo = photo
        
        super.init()
        
        // Initialization should fail if there is no deli name
        if name.isEmpty {
            return nil
        }
    }
}
