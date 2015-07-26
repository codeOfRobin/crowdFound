//
//  addObjectViewController.swift
//  lostitudeSwift
//
//  Created by Robin Malhotra on 26/07/15.
//  Copyright © 2015 Robin Malhotra. All rights reserved.
//

import UIKit
import Parse
class addObjectViewController: UIViewController {
    

    @IBOutlet weak var nameTextField: UITextField!
    @IBAction func saveObject(sender: AnyObject)
    {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let closestBeacon = appDelegate.closestBeacon
        let newObject = PFObject(className: "items")
        newObject["minor"] = closestBeacon.minor
        print(closestBeacon.minor)
        newObject["name"] = nameTextField.text
        newObject["major"] = 2
        let defaults = NSUserDefaults.standardUserDefaults()
        newObject["UserName"]=defaults.objectForKey("UserName")
        newObject["status"]=true
        newObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }

        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    @IBAction func exit(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true) { () -> Void in
            print("sadfljnaskdfnj")
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    

}
