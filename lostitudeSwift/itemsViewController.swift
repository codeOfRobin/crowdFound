//
//  itemsViewController.swift
//  lostitudeSwift
//
//  Created by Robin Malhotra on 25/07/15.
//  Copyright © 2015 Robin Malhotra. All rights reserved.
//

import UIKit
import Parse
class itemsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let tableView=UITableView()
    var dataArray :[PFObject]?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame=view.frame
        tableView.backgroundColor=UIColor.redColor()
        tableView.dataSource=self
        tableView.registerClass(customTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.contentInset.top=self.navigationController!.navigationBar.frame.size.height+10
        tableView.rowHeight=70
        tableView.separatorStyle=UITableViewCellSeparatorStyle.None
        view.addSubview(tableView)
        let query = PFQuery(className:"items")
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                self.dataArray=objects as? [PFObject]
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        print(object.objectId)
                    }
                }
            self.tableView.reloadData()
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let x = dataArray?.count
        {
            return x
        }
        else
        {
            return 0
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! customTableViewCell!
        
        if(cell == nil)
        {
            cell=customTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        }
        
        if let currentItem = dataArray?[indexPath.row]
        {
            cell!.titleLabel.text=currentItem["name"] as? String
            cell!.item = currentItem
            cell!.lastSeenAtLabel.text=currentItem["updatedAt"] as? String
            cell!.setStatusButtonImage()
        }
        return cell!
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
