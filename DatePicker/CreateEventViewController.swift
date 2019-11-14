//
//  ViewController.swift
//  DatePicker
//
//  Created by Oscar Victoria Gonzalez  on 11/14/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {
    
    // MARK: - Outlets
    
    
    @IBOutlet weak var eventTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var createEventButton: UIButton!
    @IBOutlet weak var rsvpLabel: UILabel!
    
    var event: Event! {
        didSet { // property observer, gets called when the property changes
            // update UI whenever the event changes
            if event.willAttend {
                // will update label and button
                rsvpLabel.text = "RSVP YES"
                createEventButton.setTitle("View Event", for: .normal)
            } else {
                rsvpLabel.text = "RSVP NO"
                createEventButton.setTitle("RSVP to Event", for: .normal)
    
            }
        }
    
    }
    
    
    
    // MARK: - View Controllerlife cycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        event = Event(name: "Event name not set", willAttend: false, date: Date())
        eventTextField.delegate = self // self is this view controller instance
        
        // configure the date picker in code
        
        datePicker.minimumDate = Date() // user is not allowed to set an event prior to today's date.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepareForSegue")
        
        // here is where we want to setup and pass the event data to the detail view controlller
        
        // 1. we need to get an instance of the detail view controller
        // the  detailViewController is where we are transition to ->
        // seggue.source is where the segue is coming from
        // segue.destination is where the segue is going to
        guard let detailViewController = segue.destination as? DetailViewController else {
            return
        }
        
        // we could set the event on the detail view controller
        detailViewController.event = event
    }
    
    
    // MARK: - Actions and Methods
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        // updating the event's date
        event.date = sender.date
        
    }
    
    
    
    


}

extension CreateEventViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        // updating the event s name.
        event.name = eventTextField.text ?? "" //  use nil-coalescing  to unwrapp
        
        return true 
    }
}
