//
//  TimerViewController.swift
//  pomodoroPlus
//
//  Created by Samuel Ollason on 23/11/2018.
//  Copyright © 2018 Samuel Ollason. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    var selectedTime = 999
    var time         = 999
    var seconds = 60 //This variable will hold a starting value of seconds. It could be any amount above 0.
   
    var timer          = Timer()
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    var pauseActive    = false

    @IBOutlet weak var timeRemaningLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resumeButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var pictureButton: UIButton!
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        if pauseButton.isEnabled {
            // If here then user wants to pause timer from running
            // so we stop timer and mark that the user has paused
            // countdown
            timer.invalidate()
            
            resumeButton.isEnabled = true;
            pauseButton.isEnabled  = false;
            self.pauseActive = true
        }
    }
    
    @IBAction func resumeButtonTapped(_ sender: Any) {
        if resumeButton.isEnabled {
            // If here then user wants to restart timer.
            // after previously pausing
            runTimer()
            self.pauseActive = false
            
            // Allow users to pause but make 'reset' button disabled
            resumeButton.isEnabled = false;
            pauseButton.isEnabled  = true;
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        //If here then user want to start timer again
        // after previously pausing
        timer.invalidate()

        // Don't timer to be running or paused
        self.pauseActive = false

        // reset time and reflect this in label
        time = selectedTime;
        timeRemaningLabel.text = "\(time)"
        
        resumeButton.isEnabled = true;
        pauseButton.isEnabled  = false;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the timer variable that will change as time goes down
        time = selectedTime
        timeRemaningLabel.text = String(time)
        
        // Start the timer!
        runTimer()
        
        // timer will start automatically
        resumeButton.isEnabled = false
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.updateTimer)), userInfo: nil, repeats: true)
    }
    
    // Expose method to Obj-C
    @objc
    func updateTimer() {
        if(time == 0){
            pictureButton.isEnabled = true
            timer.invalidate()
        } else {
            time -= 1 // This will decrement(count down)the seconds.
        }
        
        let timeRemaining = getStringTime()
        
        timeRemaningLabel.text = "\(timeRemaining)" //Interpolation to will update the label.
    }
    
    func getStringTime() -> String {
        let hours   = Int(time) / 60 * 60
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }

}
