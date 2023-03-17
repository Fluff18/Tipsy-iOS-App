//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Luminosity on 3/16/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var result: Double = 0.0
    var noPpl: Int = 0
    var tipPct: Int = 0
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "%.2f", result)
        settingsLabel.text = "Split between \(noPpl) people, with \(tipPct)% tip."
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func reCalcPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
