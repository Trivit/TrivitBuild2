//
//  InterfaceController.swift
//  Trivit2Watch Extension
//
//  Created by TRIVIT on 3/22/17.
//  Copyright © 2017 TRIVIT. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {

   
    let session = WCSession.default()
    let defaults = UserDefaults.standard
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        
        if (WCSession.isSupported()) {
            session.delegate = self
            session.activate()
        }
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        //Dummy Implementation
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        
        //Use this to update the UI instantaneously (otherwise, takes a little while)
        DispatchQueue.main.async {
            if let StepGoal = message["StepGoal"] as! String! {
                self.defaults.set(StepGoal, forKey:"StepGoal")
                print(StepGoal)
            }
            if let CadenceGoal = message["CadenceGoal"] as! String! {
                self.defaults.set(CadenceGoal, forKey:"CadenceGoal")
                print(CadenceGoal)
            }
            if let MovetimeGoal = message["MovetimeGoal"] as! String! {
                self.defaults.set(MovetimeGoal, forKey:"MovetimeGoal")
                print(MovetimeGoal)
            }
        }
    }

}
