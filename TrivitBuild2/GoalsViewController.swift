//
//  GoalsViewController.swift
//  TrivitBuild2
//
//  Created by TRIVIT on 3/23/17.
//  Copyright © 2017 TRIVIT. All rights reserved.
//

import UIKit
import WatchConnectivity

class GoalsViewController: UIViewController {

    @IBOutlet weak var StepRecommend: UILabel!
    @IBOutlet weak var CadenceRecommend: UILabel!
    @IBOutlet weak var MovetimeRecommend: UILabel!
    
    
    @IBOutlet weak var stepField: UITextField!
    @IBOutlet weak var CadField: UITextField!
    @IBOutlet weak var MoveField: UITextField!
    
    var session: WCSession? = WCSession.isSupported() ? WCSession.default() : nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        stepField.keyboardType = UIKeyboardType.numberPad
        CadField.keyboardType = UIKeyboardType.numberPad
        MoveField.keyboardType = UIKeyboardType.numberPad

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let activity = defaults.string(forKey: "activityLevel")
        switch activity! {
            case "low":
                StepRecommend.text = "I'd recommend 6000"
                stepField.placeholder = "6000"
                CadenceRecommend.text = "I'd recommend 3.0"
                CadField.placeholder = "3.0"
                MovetimeRecommend.text = "I'd recommend 40%"
                MoveField.placeholder = "40"
            break
            case "medium":
                StepRecommend.text = "I'd recommend 8000"
                stepField.placeholder = "8000"
                CadenceRecommend.text = "I'd recommend 4.0"
                CadField.placeholder = "4.0"
                MovetimeRecommend.text = "I'd recommend 30%"
                MoveField.placeholder = "30"
            break
            case "high":
                StepRecommend.text = "I'd recommend 10000"
                stepField.placeholder = "10000"
                CadenceRecommend.text = "I'd recommend 5.0"
                CadField.placeholder = "5.0"
                MovetimeRecommend.text = "I'd recommend 25%"
                MoveField.placeholder = "25"
            break
            default:
            break
        }
        
        if (WCSession.isSupported()) {
            session?.delegate = self
            session?.activate()
        }

    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    @IBAction func ReadyButton(_ sender: Any) {
        
        let goalStep = stepField.text;
        let goalCadence = CadField.text;
        let goalMovetime = MoveField.text;
        
        let gStep = ["StepGoal": stepField.text!]
        let gCad = ["CadenceGoal": CadField.text!]
        let gMove = ["MovetimeGoal": MoveField.text!]
        
        let defaults = UserDefaults.standard
        defaults.set(goalStep, forKey: "StepGoal")
        defaults.set(goalCadence, forKey: "CadenceGoal")
        defaults.set(goalMovetime, forKey: "MovetimeGoal")
        
        if let session = session, session.isReachable {
            session.sendMessage(gStep,replyHandler: { replyData in
                                    // handle reply from iPhone app here
                                    print("MESSAGE SEND")
            }, errorHandler: { error in
                // catch any errors here
                print(error)
            })
        } else {
            
        }
        if let session = session, session.isReachable {
            session.sendMessage(gCad,replyHandler: { replyData in
                // handle reply from iPhone app here
                print("MESSAGE SEND")
            }, errorHandler: { error in
                // catch any errors here
                print(error)
            })
        } else {
            
        }
        if let session = session, session.isReachable {
            session.sendMessage(gMove,replyHandler: { replyData in
                // handle reply from iPhone app here
                print("MESSAGE SEND")
            }, errorHandler: { error in
                // catch any errors here
                print(error)
            })
        } else {
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
// MARK: WCSessionDelegate
extension GoalsViewController: WCSessionDelegate {
    /** Called when all delegate callbacks for the previously selected watch has occurred. The session can be re-activated for the now selected watch using activateSession. */
    @available(iOS 9.3, *)
    public func sessionDidDeactivate(_ session: WCSession) {
        //Dummy Implementation
    }
    
    /** Called when the session can no longer be used to modify or add any new transfers and, all interactive messages will be cancelled, but delegate callbacks for background transfers can still occur. This will happen when the selected watch is being changed. */
    @available(iOS 9.3, *)
    public func sessionDidBecomeInactive(_ session: WCSession) {
        //Dummy Implementation
    }
    
    /** Called when the session has completed activation. If session state is WCSessionActivationStateNotActivated there will be an error with more details. */
    @available(iOS 9.3, *)
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        //Dummy Implementation
    }
    
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        
        //Use this to update the UI instantaneously (otherwise, takes a little while)
        
    }
}

