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

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let activity = defaults.string(forKey: "activityLevel")
        print(activity)
        switch activity! {
            case "low":
                StepRecommend.text = "I'd recommend 6000"
                CadenceRecommend.text = "I'd recommend 3.0"
                MovetimeRecommend.text = "I'd recommend 40%"
            break
            case "medium":
                StepRecommend.text = "I'd recommend 8000"
                CadenceRecommend.text = "I'd recommend 4.0"
                MovetimeRecommend.text = "I'd recommend 30%"
            break
            case "high":
                StepRecommend.text = "I'd recommend 10000"
                CadenceRecommend.text = "I'd recommend 5.0"
                MovetimeRecommend.text = "I'd recommend 25%"
            break
            default:
            break
        }

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
