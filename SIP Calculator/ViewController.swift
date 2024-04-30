//
//  ViewController.swift
//  SIP Calculator
//
//  Created by mac on 3/31/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sipAmountTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var annualReturnRateTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var btn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional setup code
        sipAmountTextField.layer.borderWidth = 2
        durationTextField.layer.borderWidth = 2
        annualReturnRateTextField.layer.borderWidth = 2
        btn.layer.shadowOpacity = 5
    }

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        if let futureValue = calculateSIPValue() {
            resultLabel.text = String(format: NSLocalizedString("Future Value: ₹%.2f", comment: ""), futureValue)
        } else {
            resultLabel.text = NSLocalizedString("Invalid input. Please enter valid numbers.", comment: "")
        }
    }

    func calculateSIPValue() -> Double? {
        guard let sipAmountText = sipAmountTextField.text,
              let durationText = durationTextField.text,
              let annualReturnRateText = annualReturnRateTextField.text,
              let sipAmount = Double(sipAmountText),
              let duration = Int(durationText),
              let annualReturnRate = Double(annualReturnRateText) else {
            return nil // Return nil if any required input is missing or invalid
        }
        
        if sipAmount <= 0 || duration <= 0 || annualReturnRate <= 0 {
            return nil // Return nil for non-positive inputs
        }
        
        let monthlyReturnRate = annualReturnRate / 12 / 100
        let totalMonths = duration * 12
        
        let futureValue = sipAmount * ((pow(1 + monthlyReturnRate, Double(totalMonths)) - 1) / monthlyReturnRate) * (1 + monthlyReturnRate)
        
        return futureValue
    }
}



















//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//    }
//
   
/* private func animateLogo(){
    UIView.animate(withDuration: 0.9, animations: {
        let size = self.view.frame.size.width * 1.5
        let newX = size - self.view.frame.size.width
        let newY = self.view.frame.size.height - size
        self.myImgView.frame = CGRect(x: -(newX/2), y: newY/2, width: size, height: size)
    })
    UIView.animate(withDuration: 0.9, animations: {
        self.myImgView.alpha = 0
    }, completion: {
        done in
        if done {
            DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.2, execute: {
                self.performSegue(withIdentifier: "sainath", sender: nil)
                
            })
        }
    })
    }
    
}
 */





