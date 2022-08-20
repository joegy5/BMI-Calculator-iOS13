//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Joel Gurivireddy on 7/19/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var BMI : BMIInterpreter?
    
    mutating func calculateBMI(height : Float, weight : Float) {
        let BMIValue = weight / pow(height, 2)
        
        if BMIValue < 18.5 {
            BMI = BMIInterpreter(value: BMIValue, advice: "Eat more snacks", color: UIColor.blue)
        }
        else if BMIValue < 24.9 {
            BMI = BMIInterpreter(value: BMIValue, advice: "You have a healthy BMI!", color: UIColor.green)
        }
        else {
            BMI = BMIInterpreter(value: BMIValue, advice: "Get some exercise!", color: UIColor.red)
        }
    }

    func getBMIValue() -> String {
        return String(format : "%.1f",  BMI?.value ?? 0.0)
    }

    func getColor() -> UIColor {
        return BMI?.color ?? UIColor.black
    }

    func getAdvice() -> String{
        return BMI?.advice ?? ""
    }
}


