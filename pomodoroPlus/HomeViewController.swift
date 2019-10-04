//
//  HomeViewController.swift
//  pomodoroPlus
//
//  Created by Samuel Ollason on 23/11/2018.
//  Copyright © 2018 Samuel Ollason. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

   
    @IBOutlet weak var initialCountDownTime: UITextField!
   
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func unwindToHome(unwindSegue: UIStoryboardSegue) {

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTimerViewSegue" {

            let dateFormatter = DateFormatter();
            dateFormatter.dateFormat = "HH:mm";

            let time = dateFormatter.string(from: datePicker.date)
            
            print("time: " + time);
        
            let colonPos = time.firstIndex(of: ":")!

            // The ... syntax allows us to access a string from a given index until the end
            let hoursComponent = Int(time[..<colonPos])!;
            let minsComponent  = Int(time.suffix(2))!;
            
//            print("hours: " + hours);
//            print("mins: " + mins);

            // unwrap as these are optionals
//            let hoursInt     = Int(hours)!;
//            let minsHoursInt = Int(mins)!;
            
            // Get hours in eg 13.13 format
//            let hours = Double(hoursComponent) + Double(minsComponent)/Double(60);
            
//            print("minsCompInHours: " + String(Double(minsComponent)/Double(60)));

//            print("hours: " + String(hours));
            
            let hoursInSecs = hoursComponent * 60 * 60;
            let minsInSecs  = minsComponent * 60;
            
            let timeInSecs = hoursInSecs + minsInSecs;
            print("total time in secs: " + String(timeInSecs));

            // vc is a reference to the segues's destination view controller (i.e. the
            // one we want to navigate to).
            // By default Swift will assume that the destination is type UIViewController, and not our specific subclass.
            // We use 'as!' keyword to downcast the destination to the correct
            // object type.
            // Once we have done this we can access the initialCountDownTime
            // property of the next vc and modify it.
            let vc = segue.destination as! TimerViewController;
            
            // since the text property is an option we must unwrap with !
//            print("initialCountDownTime.text!: " + initialCountDownTime.text!)
            
            vc.selectedTime = timeInSecs;

        }
    }
    


}

