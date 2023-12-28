//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Cahya Triamelia on 15/05/23.
//  Copyright © 2023 Cahya Triamelia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Membuat variabel dan menginisialisasikan input berat dan tinggi badan
    @IBAction func calcBMI(sender: UIButton) {
        let weightString = weightTextField.text
        let weight = Double(weightString!)
    
        let heightString = heightTextField.text
        let height = Double(heightString!)
        
        // Menghitung dan mengelompokkan hasil BMI
        let result = weight!/(height!*height!)
        resultLabel.text = String(format: "%.1f", result)
        switch result {
        case let result where result < 18.5:
            categoryLabel.text = "Underweight"
        case let result where result < 24.9:
            categoryLabel.text = "Normal"
        case let result where result < 29.9:
            categoryLabel.text = "Overweight"
        case let result where result < 39.9:
            categoryLabel.text = "Obesity"
        case let result where result > 40:
            categoryLabel.text = "Extreme Obesity"
        default:
            categoryLabel.text = "Error"
        }
    }
    // Menghitung ulang hasil BMI
    @IBAction func recalcBMI(sender: UIButton) {
        self.weightTextField.text = nil
        self.heightTextField.text = nil
        categoryLabel.text = "Normal"
        resultLabel.text = "0"
        weightTextField.becomeFirstResponder()
    }
}

