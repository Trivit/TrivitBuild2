//
//  HeightViewController.swift
//  TrivitBuild2
//
//  Created by Jagath Jai Kumar on 3/22/17.
//  Copyright © 2017 TRIVIT. All rights reserved.
//

import UIKit

class HeightViewController: UIViewController {

    
    
    @IBOutlet weak var WeightField: UITextField!
    @IBOutlet weak var InField: UITextField!
    @IBOutlet weak var FeetField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        FeetField.keyboardType = UIKeyboardType.numberPad
        InField.keyboardType = UIKeyboardType.numberPad
        WeightField.keyboardType = UIKeyboardType.numberPad
        
        // Do any additional setup after loading the view.
       let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    @IBAction func nextButton(_ sender: Any) {
        let feet = FeetField.text;
        let inches = InField.text;
        let weight = WeightField.text;
        
        
        let defaults = UserDefaults.standard
        defaults.set(feet, forKey: "feetHeight")
        defaults.set(inches, forKey: "inchesHeight")
        defaults.set(weight, forKey: "weight")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
