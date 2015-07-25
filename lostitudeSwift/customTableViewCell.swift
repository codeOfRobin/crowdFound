//
//  customTableViewCell.swift
//  sauravKaTableView
//
//  Created by Robin Malhotra on 07/07/15.
//  Copyright © 2015 Robin Malhotra. All rights reserved.
//
import QuartzCore
import UIKit
import Parse
class customTableViewCell: UITableViewCell {
    let titleLabel=UILabel()
    let lastSeenAtLabel=UILabel()
    let statusButton=UIButton()
    var item=PFObject(className:"item")
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }
    required init(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    override func layoutSubviews() {
        titleLabel.frame=CGRectMake(10, 10, 0.75*bounds.width, 0.66*bounds.height-20)
        self.addSubview(titleLabel)
        lastSeenAtLabel.frame = CGRectMake(10, CGRectGetMaxY(titleLabel.frame), 0.75*bounds.width, 0.33*bounds.height)
        self.addSubview(lastSeenAtLabel)
        statusButton.frame=CGRectMake(0.75*bounds.width, 10, bounds.height-20, bounds.height-20)
        self.addSubview(statusButton)
        statusButton.contentMode = UIViewContentMode.ScaleAspectFit;
        statusButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Fill
        statusButton.contentVerticalAlignment = UIControlContentVerticalAlignment.Fill
        statusButton.addTarget(self, action: Selector("changeState"), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func changeState()
    {
        if let status = item["status"] as? Bool
        {
            item["status"] = !status
            self.setStatusButtonImage()
            item.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                print("Object has been saved.")
            }
        }
    }
    
    func setStatusButtonImage()
    {
        if item["status"] as? Bool==true
        {
            self.statusButton.setBackgroundImage(UIImage(named: "cross"), forState: UIControlState.Normal)
        }
        else
        {
            self.statusButton.setBackgroundImage(UIImage(named: "tick"), forState: UIControlState.Normal)
        }
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
