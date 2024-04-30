//
//  SWP'sViewController.swift
//  SIP Calculator
//
//  Created by mac on 4/1/24.
//

import UIKit

class SWP_sViewController: UIViewController {
    @IBOutlet weak var investmentAmountTextField: UITextField!
       @IBOutlet weak var withdrawalRateTextField: UITextField!
       @IBOutlet weak var withdrawalFrequencyTextField: UITextField!
       @IBOutlet weak var resultLabel: UILabel!

    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.layer.shadowOpacity = 5
        investmentAmountTextField.layer.borderWidth = 2
        withdrawalRateTextField.layer.borderWidth = 2
        withdrawalFrequencyTextField .layer.borderWidth = 2



        
    }
    
    
    @IBAction func buttonActionPressed(_ sender: UIButton) {
        guard let investmentStr = investmentAmountTextField.text,
                 let withdrawalRateStr = withdrawalRateTextField.text,
                 let withdrawalFreqStr = withdrawalFrequencyTextField.text,
                 let investment = Double(investmentStr),
                 let withdrawalRate = Double(withdrawalRateStr),
                 let withdrawalFreq = Double(withdrawalFreqStr) else {
               resultLabel.text = "Invalid input"
               return
           }

           let swpAmount = investment * (withdrawalRate / 100) * withdrawalFreq
           resultLabel.text = "SWP Amount: \(String(format: "₹%.2f", swpAmount))"
        
        
        
        
        
    }
    
    
    
    
    
}
