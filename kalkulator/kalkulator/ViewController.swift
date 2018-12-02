//
//  ViewController.swift
//  kalkulator
//
//  Created by Michał on 01/12/2018.
//  Copyright © 2018 Michał. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var InputTextField: UITextField!

    @IBOutlet weak var button_9: CalculatorButton!
    @IBOutlet weak var button_8: CalculatorButton!
    @IBOutlet weak var button_7: CalculatorButton!
    @IBOutlet weak var button_6: CalculatorButton!
    @IBOutlet weak var button_5: CalculatorButton!
    @IBOutlet weak var button_4: CalculatorButton!
    @IBOutlet weak var button_3: CalculatorButton!
    @IBOutlet weak var button_2: CalculatorButton!
    @IBOutlet weak var button_1: CalculatorButton!
    @IBOutlet weak var button_0: CalculatorButton!
    
    @IBOutlet weak var button_division: OperationButton!
    @IBOutlet weak var button_multiply: OperationButton!
    @IBOutlet weak var button_sub: OperationButton!
    @IBOutlet weak var button_add: OperationButton!
    @IBOutlet weak var button_submit: OperationButton!
    @IBOutlet weak var button_clear: OperationButton!
    
    var state :(Double?, Double?) = (nil,nil) {
        didSet {
            printState()
        }
    }
    
    var operation : CalculatorOperation? {
        didSet {
            printState()
        }
    }
    
    var symbol : String = "" {
        didSet {
            printState()
        }
    }
    
    private func getStringFromOptional(_ optional: Double?) -> String {
        if let value = optional {
            return String(value)
        }
        return ""
    }
    private func printState() -> Void {
        InputTextField.text = "\(getStringFromOptional(state.0)) \(symbol) \(getStringFromOptional(state.1))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button_0.setProperties(number: 0)
        button_1.setProperties(number: 1)
        button_2.setProperties(number: 2)
        button_3.setProperties(number: 3)
        button_4.setProperties(number: 4)
        button_5.setProperties(number: 5)
        button_6.setProperties(number: 6)
        button_7.setProperties(number: 7)
        button_8.setProperties(number: 8)
        button_9.setProperties(number: 9)
        
        button_add.setProperties(operation: CalculatorOperation.add, symbol: "+")
        button_sub.setProperties(operation: CalculatorOperation.substract, symbol: "-")
        button_multiply.setProperties(operation: CalculatorOperation.multiply, symbol: "*")
        button_division.setProperties(operation: CalculatorOperation.division, symbol: "/")
    }

    
    
    private func makeOperation(){
        let value0 = state.0 ?? 0
        let value1 = state.1 ?? 0
        
        if let operation = self.operation {
            switch operation {
            case CalculatorOperation.add:
                state = (value0 + value1, nil)
            case CalculatorOperation.substract:
                state = (value0 - value1, nil)
            case CalculatorOperation.division:
                state = (value0 / value1, nil)
            case CalculatorOperation.multiply:
                state = (value0 * value1, nil)
            case CalculatorOperation.clear:
                state = (nil, nil)
                self.operation = nil
            }
        }
    }
    
    @IBAction func SubmitButtonClick(_ sender: OperationButton) {
        makeOperation()
        operation = nil
        symbol = ""
    }
    
    @IBAction func ValueButtonClick(_ sender: CalculatorButton) {
        if operation == nil {
            state.0 = (state.0 ?? 0) * 10 + Double(sender.number ?? 0)
        } else {
            state.1 = (state.1 ?? 0) * 10 + Double(sender.number ?? 0)
        }
    }
    
    @IBAction func OperationButtonClick(_ sender: OperationButton) {
        operation = sender.operation
        if let symbol = sender.symbol {
            self.symbol = symbol
        }
    }
    
    @IBAction func clearButtonClick(_ sender: Any) {
        operation = nil;
        symbol = ""
        state = (nil,nil);
    }
}
