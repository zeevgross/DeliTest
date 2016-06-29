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
    var comment: String
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, comment: String) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.comment = comment
        
        super.init()
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty {
            return nil
        }
    }
    
}