//
//  MovetimeController.swift
//  TrivitBuild2
//
//  Created by TRIVIT on 3/22/17.
//  Copyright © 2017 TRIVIT. All rights reserved.
//

import WatchKit
import Foundation


class MovetimeController: WKInterfaceController {
    
    @IBOutlet var GoalMove: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        GoalMove.setText(UserDefaults.standard.string(forKey: "MovetimeGoal"))
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


