//
//  FirstViewController.swift
//  DeliTest
//
//  Created by Zeev Gross on 18/06/2016.
//  Copyright © 2016 Zeev Gross. All rights reserved.
//

import UIKit







class FirstViewController: UIViewController {

    // MARK: Proprties
    
    @IBAction func customerRegistration(sender: AnyObject) {

        print("register")
    }
   
    @IBAction func CustomerLogin(sender: AnyObject) {
    
        print("login")
        print(self.userName.text, "PW" , passWord.text)
    }
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        userName.text = "Zeev"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

