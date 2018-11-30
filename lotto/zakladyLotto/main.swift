//
//  main.swift
//  zakladyLotto
//
//  Created by Student on 08.10.2018.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation

func generujMaszyneLosujaca(zakres:(Int,Int))->((Int)->Int){
    
    let returnFunction: ((Int)->Int) = { (val: Int) in
        print(val*2)
        return(val*2)
    }
    return returnFunction
}

let multiMulti = generujMaszyneLosujaca(zakres:(1,10))
//multiMulti(2)

enum TypKuponu {
    case MultiMulti,
    DuzyLotek,
    MalyLotek
}

class Kupon {
	var lista = [Int]()
	var typKuponu: TypKuponu
	init(typKuponu: TypKuponu){
		self.typKuponu = typKuponu
		var liczbaCyfr=0
		var maksymalnaLiczba=0
		switch(self.typKuponu){
			case .MultiMulti:
				liczbaCyfr=10	
				maksymalnaLiczba=31
				break
			case .DuzyLotek:
				liczbaCyfr=7
				maksymalnaLiczba=49
				break	
			case .MalyLotek:
				maksymalnaLiczba=31
				liczbaCyfr=6
				break
		}
		for _ in 1...liczbaCyfr{
			lista.append(Int(arc4random_uniform(UInt32(maksymalnaLiczba))))
		}
	}
}

class Lottomat {
    func generujKupon(jaki:TypKuponu)->Kupon{
	return Kupon(typKuponu:jaki)  	      
    }
}

var lottmat = Lottomat()
var kupon = lottmat.generujKupon(jaki:TypKuponu.MultiMulti)
print(kupon.lista)
