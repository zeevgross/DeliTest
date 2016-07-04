//
//  Item.swift
//  DeliTest
//
//  Created by Zeev Gross on 26/06/2016.
//  Copyright © 2016 Zeev Gross. All rights reserved.
//

import UIKit

struct produceKey{
    static let nameKey: String = "name"
    static let photoKey: String = "photo"
    static let commentKey: String = "comment"
}

class productItem :NSObject {
    
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var quantity: String
    var weight: String
    var comment: String
    var helpNeeded: Bool
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, quantity: String,weight: String, comment: String, helpNeeded: Bool) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.comment = comment

        self.quantity = quantity
        self.weight = weight
        self.helpNeeded = helpNeeded
        
        super.init()
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty {
            return nil
        }
    }
  
}