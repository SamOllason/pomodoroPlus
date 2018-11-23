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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func unwindToHome(unwindSegue: UIStoryboardSegue) {

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTimerViewSegue" {

            // vc is a reference to the segues's destination view controller (i.e. the
            // one we want to navigate to).
            // By default Swift will assume that the destination is type UIViewController, and not our specific subclass.
            // We use 'as!' keyword to downcast the destination to the correct
            // object type.
            // Once we have done this we can access the initialCountDownTime
            // property of the next vc and modify it.
            let vc = segue.destination as! TimerViewController;
            
            // since the text property is an option we must unwrap with !
            print("initialCountDownTime.text!: " + initialCountDownTime.text!)
            
            vc.selectedTime = Int(initialCountDownTime.text!)!

        }
    }
    


}

