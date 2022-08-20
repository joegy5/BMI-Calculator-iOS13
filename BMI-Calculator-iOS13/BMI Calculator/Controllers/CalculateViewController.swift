//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f", sender.value) + "m"
    }

    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabel.text = String(round(sender.value)) + "Kg"
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height : height, weight : weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        // Built-in method
        // sender is the initiator of the segue, which is the class itself
        
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // this if-condition is there because in the case of multiple segues to multiple view controllers, we have to differentiate which view controller that we are looking at
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.BMIValue = calculatorBrain.getBMIValue()
            // the "as" keyword downcastes the segue.destination (which is currently of type UIViewController) to a reference to the ResultsViewController class
            // the exclamation mark forces the downcast because we are sure that the class reference won't be nil
            destinationVC.color = calculatorBrain.getColor()
            destinationVC.advice = calculatorBrain.getAdvice()
        }
    }
}

