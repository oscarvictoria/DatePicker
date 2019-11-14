//
//  DetailViewController.swift
//  DatePicker
//
//  Created by Oscar Victoria Gonzalez  on 11/14/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK:- Outlets and Properties
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var selectedDateLabel: UILabel!
    
    @IBOutlet weak var switchControl: UISwitch!
    
    // we need an (Event) from source view controller (CreateEventViewController)
    
    var event: Event? // default value is nil
    
    // DateFormatter will help us to format the Date object in a more readable format
    // lazy variable - is a variable that gets created the forst time its needed
   lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = . medium
    return formatter
    }() //  () calls this function (closure)

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    // method to update the UI elements
    func updateUI() {
        guard let date = event?.date else {
            return
        }
        selectedDateLabel.text = dateFormatter.string(from: date)
        // selectedDateLabel.tesxt = ""
        // set switch poition base on value of willAttend, true or false
        // if true switch will be turned on, else switch will be turned off
        switchControl.isOn = event?.willAttend ?? false
        
        messageLabel.text = event?.name ?? "event name not available"
        
    }
    
    
    @IBAction func rsvpChanged(_ sender: UISwitch) {
    }
    

}
