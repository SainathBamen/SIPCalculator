//
//  LumpsumViewController.swift
//  SIP Calculator
//
//  Created by mac on 4/2/24.
//

import UIKit

struct LumpsumSIPInfo {
    var investmentAmount: Double
    var returnRate: Double
    var investmentDurationYears: Int
    var sipFrequencyMonths: Int
}

struct LumpsumSIPCalculator {
    static func calculateMaturityAmount(for info: LumpsumSIPInfo) -> Double {
        let n = Double(info.investmentDurationYears) * 12 / Double(info.sipFrequencyMonths)
        let r = info.returnRate / 100 / Double(info.sipFrequencyMonths)
        let maturityAmount = info.investmentAmount * (pow(1 + r, n) - 1) * ((1 + r) / r)
        return maturityAmount
    }
}



class LumpsumViewController: UIViewController {
    
    @IBOutlet weak var investmentAmountTextField: UITextField!
        @IBOutlet weak var returnRateTextField: UITextField!
        @IBOutlet weak var investmentDurationTextField: UITextField!
        @IBOutlet weak var sipFrequencyTextField: UITextField!
        @IBOutlet weak var maturityLabel: UILabel!

    @IBOutlet weak var btn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        investmentAmountTextField.layer.borderWidth = 2
        returnRateTextField.layer.borderWidth = 2
        investmentDurationTextField.layer.borderWidth = 2
        sipFrequencyTextField.layer.borderWidth = 2
        
        btn.layer.shadowOpacity = 5
        
        
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard let investmentAmountStr = investmentAmountTextField.text, let returnRateStr = returnRateTextField.text, let investmentDurationStr = investmentDurationTextField.text, let sipFrequencyStr = sipFrequencyTextField.text,
                     let investmentAmount = Double(investmentAmountStr), let returnRate = Double(returnRateStr), let investmentDuration = Int(investmentDurationStr), let sipFrequency = Int(sipFrequencyStr) else {
                   // Handle invalid input
                   return
               }

               let lumpsumSIPInfo = LumpsumSIPInfo(investmentAmount: investmentAmount, returnRate: returnRate, investmentDurationYears: investmentDuration, sipFrequencyMonths: sipFrequency)
               let maturityAmount = LumpsumSIPCalculator.calculateMaturityAmount(for: lumpsumSIPInfo)
               maturityLabel.text = String(format: "Maturity Amount: %.2f", maturityAmount)
        
        
    }
    
}
