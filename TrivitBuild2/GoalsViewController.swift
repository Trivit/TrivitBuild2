//
//  GoalsViewController.swift
//  TrivitBuild2
//
//  Created by TRIVIT on 3/23/17.
//  Copyright © 2017 TRIVIT. All rights reserved.
//

import UIKit

class GoalsViewController: UIViewController {

    @IBOutlet weak var StepRecommend: UILabel!
    @IBOutlet weak var CadenceRecommend: UILabel!
    @IBOutlet weak var MovetimeRecommend: UILabel!
    
    
    @IBOutlet weak var stepField: UITextField!
    @IBOutlet weak var CadField: UITextField!
    @IBOutlet weak var MoveField: UITextField!
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

    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    @IBAction func ReadyButton(_ sender: Any) {
        
        let goalStep = stepField.text;
        let goalCadence = CadField.text;
        let goalMovetime = MoveField.text;
        
        
        let defaults = UserDefaults.standard
        defaults.set(goalStep, forKey: "StepGoal")
        defaults.set(goalCadence, forKey: "CadenceGoal")
        defaults.set(goalMovetime, forKey: "MovetimeGoal")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
