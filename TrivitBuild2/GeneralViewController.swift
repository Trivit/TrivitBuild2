//
//  FirstViewController.swift
//  TabbedProject
//
//  Created by TRIVIT on 3/22/17.
//  Copyright © 2017 TRIVIT. All rights reserved.
//

import UIKit

class GeneralViewController: UIViewController {

    @IBOutlet weak var StepGoal: UILabel!
    @IBOutlet weak var CadenceGoal: UILabel!
    @IBOutlet weak var MovetimeGoal: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//        let defaults = UserDefaults.standard
//        defaults.set("Coding Explorer", forKey: "userNameKey")
//        
//        if let name = defaults.string(forKey: "userNameKey") {
//            print(name)
//        }
        
        
        let defaults = UserDefaults.standard
        StepGoal.text = defaults.string(forKey: "StepGoal")
        CadenceGoal.text = defaults.string(forKey: "CadenceGoal")
        MovetimeGoal.text = defaults.string(forKey: "MovetimeGoal")
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

