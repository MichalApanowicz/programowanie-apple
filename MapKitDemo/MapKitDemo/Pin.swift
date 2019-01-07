//
//  Pin.swift
//  MapKitDemo
//
//  Created by Michał on 10/12/2018.
//  Copyright © 2018 Michał. All rights reserved.
//

import Foundation
import MapKit

class Pin : NSObject, MKAnnotation {
    let title : String?
    let coordinate: CLLocationCoordinate2D
    
    init (title: String, coordinate: CLLocationCoordinate2D){
        self.title = title;
        self.coordinate = coordinate;
        
        super.init()
    }
}
