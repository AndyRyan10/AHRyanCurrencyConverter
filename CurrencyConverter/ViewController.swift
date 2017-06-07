//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Andrew Ryan on 6/2/17.
//  Copyright © 2017 AndrewRyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
   
    @IBOutlet weak var inputTextField: UITextField!
    @IBAction func convertCurrency(_ sender: Any) {
        
        //check to see that the text entered can be converted to a double
        if let number = inputTextField.text, let amount = Double(number) {
            
            dollarAmount = amount
        }
        
        //adjust the labels to show the new amount
        poundLabel.text = "\(dollarAmount * poundRate)"
        yenLabel.text = "\(dollarAmount * yenRate)"
        euroLabel.text = "\(dollarAmount * euroRate)"
        
        //reset dollarAmount to zero
        dollarAmount = 0.0
    }

    @IBAction func clearButton(_ sender: Any) {
        poundLabel.text = "0.0"
        yenLabel.text = "0.0"
        euroLabel.text = "0.0"
        inputTextField.text = nil
    }
    
    @IBOutlet weak var poundLabel: UILabel!
    @IBOutlet weak var yenLabel: UILabel!
    @IBOutlet weak var euroLabel: UILabel!
    
    //exchange rates
    let poundRate = 0.69
    let yenRate = 113.94
    let euroRate = 0.89
    var dollarAmount = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTextField.delegate = self
        
    }

    //Called when 'return' key is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //Called when user taps outside the text field
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

