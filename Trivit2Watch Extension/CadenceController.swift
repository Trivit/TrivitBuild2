//
//  CadenceController.swift
//  TrivitBuild2
//
//  Created by TRIVIT on 3/22/17.
//  Copyright © 2017 TRIVIT. All rights reserved.
//

import WatchKit
import Foundation


class CadenceController: WKInterfaceController {
    
    @IBOutlet var GoalCad: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        GoalCad.setText(UserDefaults.standard.string(forKey: "CadenceGoal"))
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
