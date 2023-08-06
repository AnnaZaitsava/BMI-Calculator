//
//  CalculatorLogic.swift
//  BMI Calculator
//
//  Created by Anna Zaitsava on 6.08.23.
//

import UIKit

struct CalculatorLogic {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float , weight: Float) {
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: .blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: .green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: .red)
        }
    }
    
    mutating func getBMIValue() -> String {
        
        let bmiResult = String(format:"%.1f", bmi?.value ?? 0.0)
            return bmiResult
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
}



