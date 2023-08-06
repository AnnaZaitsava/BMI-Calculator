//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Anna Zaitsava on 5.08.23.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet var heightLabel: UILabel!
    
    @IBOutlet var weightLabel: UILabel!
    
    @IBOutlet var weightSlider: UISlider!
    
    @IBOutlet var heightSlider: UISlider!
    
    var calculorLogic = CalculatorLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func heightSliderChanged(_ sender: UISlider)
    {
        let height = (String(format: "%.2f", sender.value))
        
        heightLabel.text = "\(height)m"
        
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        
       let weight = (String(format: "%.0f", sender.value))
        
        weightLabel.text = "\(weight)kg"
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        let weight = weightSlider.value
        let height = heightSlider.value
        
        calculorLogic.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculorLogic.getBMIValue()
            destinationVC.advice = calculorLogic.getAdvice()
            destinationVC.color = calculorLogic.getColor()
        }
    }
}

