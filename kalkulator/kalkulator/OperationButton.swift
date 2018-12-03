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
        
        self.contentEdgeInsets = UIEdgeInsets.init(top: CGFloat(10),  left: CGFloat(10), bottom: CGFloat(10), right: CGFloat(10))
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    func setProperties(operation: CalculatorOperation? = nil, symbol: String? = nil) -> Void {
        self.operation = operation
        self.symbol = symbol
    }
}
