//
//  FDViewController.swift
//  SIP Calculator
//
//  Created by mac on 4/1/24.
//

import UIKit


// Calculator.swift

struct FDInfo {
    var principalAmount: Double
    var interestRate: Double
    var tenure: Int
}

struct Calculator {
    static func calculateMaturityAmount(for info: FDInfo) -> Double {
        let rate = info.interestRate / 100
        let compoundInterest = info.principalAmount * pow((1 + rate), Double(info.tenure))
        return compoundInterest
    }
}


class FDViewController: UIViewController {

       @IBOutlet weak var principalTextField: UITextField!
       @IBOutlet weak var interestRateTextField: UITextField!
       @IBOutlet weak var tenureTextField: UITextField!
       @IBOutlet weak var maturityLabel: UILabel!

    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        principalTextField.layer.borderWidth = 2
        interestRateTextField.layer.borderWidth = 2
        tenureTextField.layer.borderWidth = 2
        btn.layer.shadowOpacity = 5




    }
    

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
            guard let principalStr = principalTextField.text, let interestRateStr = interestRateTextField.text, let tenureStr = tenureTextField.text,
                  let principal = Double(principalStr), let interestRate = Double(interestRateStr), let tenure = Int(tenureStr) else {
                // Handle invalid input
                return
            }
        let fdInfo = FDInfo(principalAmount: principal, interestRate: interestRate, tenure: tenure)
                let maturityAmount = Calculator.calculateMaturityAmount(for: fdInfo)
                maturityLabel.text = String(format: "Maturity Amount: %.2f", maturityAmount)
            }
}
