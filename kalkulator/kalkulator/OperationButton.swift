//
//  CalculatorButton.swift
//  kalkulator
//
//  Created by Michał on 01/12/2018.
//  Copyright © 2018 Michał. All rights reserved.
//

import Foundation
import UIKit

enum CalculatorOperation {
    case add;
    case substract;
    case multiply;
    case division;
    case clear;
}

class OperationButton: UIButton {
    
    var operation : CalculatorOperation?
    var symbol : String?
    
    required init(operation: CalculatorOperation?, symbol: String?) {
        self.operation = operation
        self.symbol = symbol
        
        super.init(frame: .zero)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setProperties(operation: CalculatorOperation? = nil, symbol: String? = nil) -> Void {
        self.operation = operation
        self.symbol = symbol
    }
}
