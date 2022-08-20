//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by Joel Gurivireddy on 7/19/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var suggestionLabel: UILabel!
    
    var BMIValue : String?
    var color : UIColor?
    var advice : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = BMIValue
        view.backgroundColor = color
        suggestionLabel.text = advice
        // No errors here because the .text methods are also optional data types as they can handle being nil 
        
        
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
        // The inbuild dismiss unction returns back to the previous screen
        // this works because different screens are already laid on top of each oter. By dismissing onem we can see the one below it
    }
}
