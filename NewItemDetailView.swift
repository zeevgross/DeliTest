//
//  NewItemDetailView.swift
//  DeliTest
//
//  Created by Zeev Gross on 03/07/2016.
//  Copyright © 2016 Zeev Gross. All rights reserved.
//


import UIKit

class NewItemDetailView: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Proprties
    
    
    var item: productItem? = nil
    
    @IBOutlet weak var newItemImage: UIImageView!
    @IBOutlet weak var newItemQuantity: UITextField!
    @IBOutlet weak var newItemWeight: UITextField!
    @IBOutlet weak var careNeededSwitch: UISwitch!
    @IBOutlet weak var newItemComment: UITextView!
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let item = item {
            newItemWeight.text   = item.weight
            newItemQuantity.text = item.quantity
            newItemImage.image   = item.photo
            careNeededSwitch.on  = item.helpNeeded
            newItemComment.text  = item.comment
        }
  
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
