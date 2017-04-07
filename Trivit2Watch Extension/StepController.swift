//
//  StepController.swift
//  TrivitBuild2
//
//  Created by TRIVIT on 3/22/17.
//  Copyright © 2017 TRIVIT. All rights reserved.
//

import WatchKit
import Foundation
import CoreMotion
class StepController: WKInterfaceController {
    
    @IBOutlet var GoalStep: WKInterfaceLabel!
    
    @IBOutlet var NumSteps: WKInterfaceLabel!
    let defaults = UserDefaults.standard
    let corePedometer = CMPedometer()

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
//        let defaults = UserDefaults(suiteName: "group.TrivitBuild2")
//        defaults!.synchronize()
//        if let goalStep = defaults!.string(forKey: "StepGoal") {
//            print("here")
//            GoalStep.setText(goalStep)
//        }
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
        
        if (!CMPedometer.isStepCountingAvailable()) {
            GoalStep.setText(UserDefaults.standard.string(forKey: "Progress"))
            NumSteps.setText(UserDefaults.standard.string(forKey: "Goal"))
        }
        else {
            startPedometerUpdates()
            GoalStep.setText(UserDefaults.standard.string(forKey: "StepGoal"))
        }
        
        
        
    }
    func startPedometerUpdates(){
        
        let date = Date()
        let calendar: Calendar? = Calendar(identifier: Calendar.Identifier.gregorian)
        let startDay = calendar!.startOfDay(for: date)
  
        if (!CMPedometer.isStepCountingAvailable()){
            print("Pedometer not available")
        }
            //if its available query data from the start of the day
        else{
            corePedometer.queryPedometerData(from: startDay, to: Date()) { (data: CMPedometerData? , error) -> Void in
                if(error != nil){
                    print("Error in query: \(error!)")
                }
                else{
                    self.NumSteps.setText("\(data!.numberOfSteps)")
                }
            }
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
