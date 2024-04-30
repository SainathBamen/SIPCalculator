//
//  EMIViewController.swift
//  SIP Calculator
//
//  Created by mac on 4/2/24.
//

import UIKit


struct LoanInfo {
    var loanAmount: Double
    var interestRate: Double
    var tenureMonths: Int
}

struct EMICalculator {
    static func calculateEMI(for loanInfo: LoanInfo) -> Double {
        let rate = loanInfo.interestRate / 100 / 12
        let n = loanInfo.tenureMonths
        let emi = (loanInfo.loanAmount * rate * pow(1 + rate, Double(n))) / (pow(1 + rate, Double(n)) - 1)
        return emi
    }
}

class EMIViewController: UIViewController {
    
        @IBOutlet weak var loanAmountTextField: UITextField!
        @IBOutlet weak var interestRateTextField: UITextField!
        @IBOutlet weak var tenureMonthsTextField: UITextField!
        @IBOutlet weak var emiLabel: UILabel!

    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loanAmountTextField.layer.borderWidth = 2
        interestRateTextField.layer.borderWidth = 2
        tenureMonthsTextField.layer.borderWidth = 2
        btn.layer.shadowOpacity = 5




        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
            guard let loanAmountStr = loanAmountTextField.text, let interestRateStr = interestRateTextField.text, let tenureMonthsStr = tenureMonthsTextField.text,
                  let loanAmount = Double(loanAmountStr), let interestRate = Double(interestRateStr), let tenureMonths = Int(tenureMonthsStr) else {
                // Handle invalid input
                return
            }

            let loanInfo = LoanInfo(loanAmount: loanAmount, interestRate: interestRate, tenureMonths: tenureMonths)
            let emi = EMICalculator.calculateEMI(for: loanInfo)
            emiLabel.text = String(format: "EMI: %.2f", emi)
        }
    

    
}
