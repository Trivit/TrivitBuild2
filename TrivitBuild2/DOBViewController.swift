//
//  DOBViewController.swift
//  TrivitBuild2
//
//  Created by Jagath Jai Kumar on 3/22/17.
//  Copyright © 2017 TRIVIT. All rights reserved.
//

import UIKit


class DOBViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       datePicker.setValue(UIColor.white, forKey: "textColor")
   
        
    }
    @IBAction func nextPress(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let strDate = dateFormatter.string(from: datePicker.date)
        let defaults = UserDefaults.standard
        defaults.set(strDate, forKey: "birthdate")
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

