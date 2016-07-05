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
    @IBOutlet weak var saveButton: UIButton!
   
   
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
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
/*            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            // Set the meal to be passed to MealTableViewController after the unwind segue.
            meal = Meal(name: name, photo: photo, rating: rating)
*/
        
          if let item = item {
            
                item.weight     = newItemWeight.text!
                item.quantity   = newItemQuantity.text!
                item.photo      = newItemImage.image
                item.helpNeeded = careNeededSwitch.on
                item.comment    = newItemComment.text
       
                print ("save button pressed")
            }
        }
    }
    
}
