//
//  order.swift
//  DeliTest
//
//  Created by Zeev Gross on 18/09/2016.
//  Copyright © 2016 Zeev Gross. All rights reserved.
//

import Foundation
//import UIKit


class DeliOrder: NSObject  {
    
    // MARK: Properties
    
    var deliName: String
    var items = [productItem] ()
    
    // MARK: Initialization
    
    init?(deliName: String) {
        // Initialize stored properties.
        self.deliName = deliName
        
        super.init()
        
        // Initialization should fail if there is no deli name
        if deliName.isEmpty {
            return nil
        }
    }
}


class CustomerOrder :NSObject  {
    
    // MARK: Properties
    
    var customerMail: String
    var store: String
    var deliOrders = [DeliOrder]()
    
    
    // MARK: Initialization
    
    init?(mail: String, store: String) {
        // Initialize stored properties.
        self.customerMail = mail
        self.store = store
        super.init()
        
        // Initialization should fail if there is no email address
        if mail.isEmpty {
            return nil
        }
    }
    
    
}