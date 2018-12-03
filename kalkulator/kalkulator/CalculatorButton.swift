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
        super.init(frame: .zero)
        self.number = number
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    func setProperties(number: Int? = nil) -> Void {
        self.number = number
    }
}
