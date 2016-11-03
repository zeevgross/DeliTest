//
//  order.swift
//  DeliTest
//
//  Created by Zeev Gross on 18/09/2016.
//  Copyright © 2016 Zeev Gross. All rights reserved.
//

import Foundation
//import UIKit


struct orderId
{
    var deliName: String
    var orderNum: String
    
    init()
    {
        deliName = ""
        orderNum = ""
    }
}


struct orderRsponse
{
    var deliName: String
    var orderNum: String
    var estimedTime: String
    var startTime: String
    
    init()
    {
        deliName = ""
        orderNum = ""
        estimedTime = ""
        startTime = ""
    }
}


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
    var orderTracking = [orderRsponse] ()
    var orderResponseTest = [orderId] ()
    
    
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
        debugFill()
    }
    
    func debugFill(){
        
        var ord = orderId()
        
        ord.deliName = "beef"
        ord.orderNum = "1234"
        orderResponseTest.append (ord)

        ord.deliName = "fish"
        ord.orderNum = "5678"
        orderResponseTest.append (ord)
    }

    
    /*
     // Request:
     
     {
         "customer":"zeev.gross.work@gmail.com",
         “store”:”8888”,
         "deliOrder":[
            {
                "deliName":"Beef",
                "orderId":"1234"
            },
            {
                "deliName":"fish",
                "orderId":"5678"
            }
         ]
     }
     */
   
    func pollOrderStatusRequest(orderList: [orderId]){
        
        var itemDictionary: NSDictionary = [
            "deliName":"",
            "orderId":""
        ]
        let orderpoll: NSMutableArray = []
        
        // load items into array with the order ID values
        
        let size = orderList.count
        for i in 0 ..< size
        {
 
            itemDictionary = [
                "deliName":orderList[i].deliName,
                "orderId":String(orderList[i].orderNum)
            ]
            orderpoll.addObject(itemDictionary)
        }
        
        let queryOrder: NSDictionary = [
            "custofmer":"zeev.gross.work@gmail.com",
            "store":"1234",
            "deliOrder": orderpoll
        ]
        
        
        // buld JSON from array
        
        
        if NSJSONSerialization.isValidJSONObject(queryOrder) {
            do{
                
                let data = try NSJSONSerialization.dataWithJSONObject(queryOrder, options: NSJSONWritingOptions.PrettyPrinted)
                if let myString = NSString(data: data, encoding: NSUTF8StringEncoding) {
                    print (myString)
                    sentToNet(data)
                }
            }
            catch{
                print ("error in NSJSONSerialization")
            }
        }
       
    }
    
    func sentToNet(jsonData: NSData){
        
        do {
            let url = NSURL(string: "http://echo.jsontest.com/key/value/one/two")!
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            
            // insert json data to the request
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.HTTPBody = jsonData
            
            print ("Request -> \(request)")
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data, response, error in
                if error != nil{
                    print("Error -> \(error)")
                    return
                }
                
                do {
                    let result = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? [String:AnyObject]
                    
                    print("Result -> \(result)")
                    
                } catch {
                    print("Catch Error -> \(error)")
                }
            }
            
            task.resume()
            //  return task
        }
    }
 
    
    func checkCustomer( mail: String) -> Bool
    {
        if customerMail == mail
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func checkStore( storeId: String) -> Bool
    {
        if store == storeId
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func calcProgress(order: DeliOrder){
    
    
    
        
    }
    

 /*
 // Response:
 
 {
     "customer":"zeev.gross.work@gmail.com",
     “store”:”1234”,
     "deliOrder":[
         {
             "deliName":"Beef
             "estimedTime":17:55"
             "orderId":1234"
             "startTime":17:51"
         },
         {
             "deliName":"fish
             "estimedTime":17:58"
             "orderId":1235"
             "startTime":17:51"
         },
     ]
 }
 */
    

    
    func simResponse(){
 
 //       let resultStr: String = "{\"customer\":\"zeev.gross.work@gmail.com\",\"store\":\"1234\",\"deliOrder\":[{\"deliName\":\"Beef\",\"estimatedTime\":\"29-10-2016 14:10:00\",\"orderId\":\"1234\",\"startTime\":\"29-10-2016 14:00:00\"},{\"deliName\":\"Fish\",\"estimatedTime\":\"29-10-2016 14:11:00\",\"orderId\":\"1235\",\"startTime\":\"29-10-2016 14:03:00\"},{\"deliName\":\"Cheese\",\"estimatedTime\":\"29-10-2016 14:08:00\",\"orderId\":\"1236\",\"startTime\":\"29-10-2016 14:04:02\"}]}"
        

        
        let resultStr: String = "[{\"id\": 3,\"created\": \"29-10-2016 10:38:21\",\"items\": [{\"id\": 9,\"product\": {\"id\": 1,\"name\": \"Manchego\"},\"quantity\": null,\"weight\": 0.25,      \"comments\": null,\"helpRequired\": false},{\"id\": 10,\"product\": {\"id\": 2,\"name\": \"Mozzarella\"},\"quantity\": null,\"weight\": 0.3,\"comments\": null,\"helpRequired\": false}],\"customerId\": 2,\"deliId\": 1,\"served\": true,\"eta\": \"29-10-2016 10:52:21\"},{\"id\": 4,\"created\": \"29-10-2016 10:48:04\",\"items\": [{\"id\": 11,\"product\": {\"id\": 6,\"name\": \"Schnitzel\"},\"quantity\": 12,\"weight\": null,\"comments\": null,    \"helpRequired\": false},{\"id\": 12,\"product\": {\"id\": 7,\"name\": \"Chicken leg\"},\"quantity\": 3,\"weight\": null,\"comments\": null,\"helpRequired\": false}],\"customerId\": 2,\"deliId\": 2,\"served\": false,\"eta\": \"29-10-2016 10:55:21\"}]"
            
        /*
        {\"id\": 9,\"created\": \"29-10-2016 10:29:26\",\"items\": [{\"id\": 17,\"product\": {\"id\": 1,\"name\": \"Manchego\"},\"quantity\": null,\"weight\": 0.1,\"comments\": null,    \"helpRequired\": false},{\"id\": 18,\"product\": {\"id\": 2,\"name\": \"Mozzarella\"},\"quantity\": null,\"weight\": 0.5,\"comments\": null,\"helpRequired\": false}],\"customerId\": 2,\"deliId\": 1,\"served\": false,\"eta\": null}
        ]*/


//        let resultStr: String = "{\"customer\":\"zeev.gross.work@gmail.com\",\"store\":\"1234\"}"

        // convert String to NSData
        let data: NSData = resultStr.dataUsingEncoding(NSUTF8StringEncoding)!

        if let myString = NSString(data: data, encoding: NSUTF8StringEncoding) {
            print (myString)
        }

      
        handleNewResponse(data)
        
        
    }

    func deliId2name (deli: Int) -> String
    {
        var deliName: String = ""
        
        switch deli{
            case 1: deliName = "Cheese"
            case 2: deliName = "Poultry"
            case 3: deliName = "beef"
        default:
            deliName = ""
        }
        return deliName
    }
    
    func handleNewResponse (data: NSData)
    {
        var found: Bool = false
        var orderId: String
        
        var tmpDeliResponse =  orderRsponse()
        
        do {
            let result = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [AnyObject]
            
            
            for i in 0..<result!.count
            {
                guard let deli = result![i] as? [String:AnyObject]
                    else{
                        return
                }
               
                // Process Deli Order

                
                print ("deliID = \(deli["deliId"])")
                print ("id = \(deli["id"])")
                print ("created = \(deli["created"])")
                print ("served = \(deli["served"])")
                print ("CustomerId = \(deli["CustomerId"])")
                
                let deliOrderId:Int = (deli["id"] as? Int)!
   
                orderId = String(deliOrderId)

                for j in 0..<orderTracking.count
                {
                    if (orderTracking[j].orderNum == orderId){
                        found = true
                        print ("updated")
                        
                        // Update fields
                        orderTracking[j].estimedTime = (deli["eta"] as? String)!
                        orderTracking[j].startTime = (deli["created"] as? String)!
                    }
                }
                
                if found == false{
                    
                    // Add new entry
                    
                    tmpDeliResponse.orderNum = orderId
                    tmpDeliResponse.deliName = deliId2name((deli["deliId"] as? Int)!)
                    tmpDeliResponse.estimedTime = (deli["eta"] as? String)!
                    tmpDeliResponse.startTime = (deli["created"] as? String)!
                    orderTracking.append(tmpDeliResponse)
                    print("Added")
                }

                
                // process items (not required !!)
                
                
                guard let items = deli["items"] as? [AnyObject]
                    else{
                        return
                }
                
                
                for j in 0..<items.count
                {
                    
                    print ("itemId = \(items[j]["id"])")
                    
                    guard let product = items[j]["product"] as? [String:AnyObject]
                        else{
                            return
                    }
                    print ("productId = \(product["id"])")
                    print ("Name = \(product["name"])")
                    
                }
                
            }
        }
            catch {
                print("Catch Error -> ")
        }
     }

    
    func handleResponse (data: NSData)
    {
    

        var ret: Bool = true
        var found: Bool = false
        var orderId: String
        
        var tmpDeliResponse =  orderRsponse()
        
        do {
            let result = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String:AnyObject]

            
            
            guard let cStr = result!["customer"] as? String
            else{
                return
            }
            
            if  checkCustomer(cStr) {
                customerMail = cStr
                
            }
            else{
                print ("wrong customer")
                ret = false
            }

            
            guard let storeStr = result!["store"] as? String
                else{
                    return
            }
            
            if !checkStore(storeStr) {
                store = cStr
            }
            else{
                print ("wrong customer")
                ret = false
            }
        

            // extract array
            
            guard let orderArray = result!["deliOrder"] as? NSArray
                else{
                    return
            }
       
            for i in 0..<orderArray.count
            {
                print ("stam \(i) ")
                print ("deliName \(orderArray[i]["deliName"])")
                print ("orderId \(orderArray[i]["orderId"])")
                print ("estimedTime \(orderArray[i]["estimatedTime"])")
                print ("startTime \(orderArray[i]["startTime"])")
                
                orderId = (orderArray[i]["orderId"] as? String)!
                
                found = false
        
                for j in 0..<orderTracking.count
                {
                    if (orderTracking[j].orderNum == orderId){
                        found = true
                        print ("updated")
                        
                        // Update fields
                        orderTracking[j].estimedTime = (orderArray[i]["estimatedTime"] as? String)!
                        orderTracking[j].startTime = (orderArray[i]["startTime"] as? String)!
                    }
                }

                if found == false{

                    // Add new entry

                    tmpDeliResponse.orderNum = (orderArray[i]["orderId"] as? String)!
                    tmpDeliResponse.deliName = (orderArray[i]["deliName"] as? String)!
                    tmpDeliResponse.estimedTime = (orderArray[i]["estimatedTime"] as? String)!
                    tmpDeliResponse.startTime = (orderArray[i]["startTime"] as? String)!
                    orderTracking.append(tmpDeliResponse)
                    print("Added")
                }

            }
     
            // Process order Status
     
            if !ret {
                print ("error in handleResponse")
            }
            
            
        }
    catch {
            print("Catch Error -> \(error)")
        }
        
       
        
   
    }
}

class pendingOrder :NSObject{

    var deliName: String
    var estimedTimeToService: Int
    var orderId: Int
    var startTime: Int
    
    init?(deliName: String, estimedTimeToService: Int, orderId: Int, startTime: Int) {
        // Initialize stored properties.
        
        self.deliName = deliName
        self.estimedTimeToService = estimedTimeToService
        self.orderId = orderId
        self.startTime = startTime
       
        super.init()
        
        // Initialization should fail if there is no email address
        if deliName.isEmpty {
            return nil
        }
    }
}


   