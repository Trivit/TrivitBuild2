//
//  ViewController.swift
//  TrivitBuild2
//
//  Created by TRIVIT on 3/23/17.
//  Copyright © 2017 TRIVIT. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LowActivityButton(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set("low", forKey: "activityLevel")
        performSegue(withIdentifier: "GoalMover", sender: self)
    }
    
    @IBAction func MediumActivityButton(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set("medium", forKey: "activityLevel")
        performSegue(withIdentifier: "GoalMover", sender: self)
    }

    @IBAction func HighActivityButton(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set("high", forKey: "activityLevel")
        performSegue(withIdentifier: "GoalMover", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
