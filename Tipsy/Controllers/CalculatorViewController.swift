//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var amount = 0.0
    var tip = 10
    var split = 2
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
    
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        if sender.titleLabel?.text == "0%" {
            tip = 0
        } else if sender.titleLabel?.text == "10%" {
            tip = 10
        } else {
            tip = 20
        }

    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        split = Int(sender.value)
        splitNumberLabel.text = String(split)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        amount = Double(billTextField.text ?? "0.0") ?? 0.0
        billTextField.endEditing(true)
        amount = amount * Double(100 + tip)
        amount = amount / Double(split*100)
        print(amount)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = amount
            destinationVC.noPpl = split
            destinationVC.tipPct = tip
        }
    }
}

