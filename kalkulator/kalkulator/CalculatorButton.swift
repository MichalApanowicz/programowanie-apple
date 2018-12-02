//
//  CalculatorButton.swift
//  kalkulator
//
//  Created by Michał on 01/12/2018.
//  Copyright © 2018 Michał. All rights reserved.
//

import Foundation
import UIKit

class CalculatorButton: UIButton {
    
    var number: Int?
    
    required init(number: Int?, symbol: String?) {
        self.number = number
        
        super.init(frame: .zero)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setProperties(number: Int? = nil) -> Void {
        self.number = number
    }
}
