//
//  VC_borrow.swift
//  chargeme
//
//  Created by Angela Liu on 3/29/15.
//  Copyright (c) 2015 Paul Okuda. All rights reserved.
//

import UIKit

class VC_borrow: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var deviceTextField: UITextField!
    @IBOutlet weak var chargerTableView: UITableView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    var selectedCharger = ""
    var timeRequested = 1
    var requester = PFUser.currentUser().objectId
    var sliderValue = 15

    //Also hardcoded in VC_Add_chargers
    var chargerarray = ["iPhone 4","iPhone 4S", "iPhone 5", "iPhone 5S", "iPhone 6", "iPhone 6S", "Old Macbook Pro", "Macbook Air", "New RMBP"]
    
    @IBAction func valueChanged(sender: UISlider) {
        var currentValue = Int(sender.value)
        sliderLabel.text = "\(currentValue) Minutes"
        sliderValue = Int(sender.value)
        self.slider.minimumValue = 1;
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        chargerTableView.dataSource = self
        chargerTableView.delegate = self
        NSLog(PFUser.currentUser().username)
        self.slider.value = (15);
        sliderLabel.text = "\(15) Minutes";
        sliderValue = 15;
    }
    
    // We set the number of rows to be the length of the Parse charger array
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chargerarray.count
    }
    
    // Now we're inserting a label into each table cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->   UITableViewCell {
        let cell = UITableViewCell()
        let label = UILabel(frame: CGRect(x:0, y:0, width:200, height:50))
        label.text = chargerarray[indexPath.item]
        cell.addSubview(label)
        return cell
    }
    
    // For styling, this is for UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    // Touch handler: Tapping a charger removes it
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var chargerstring = self.chargerarray[indexPath.item]
        self.selectedCharger = chargerstring
    }
    

}

