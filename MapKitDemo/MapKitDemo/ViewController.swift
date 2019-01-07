//
//  ViewController.swift
//  MapKitDemo
//
//  Created by Michał on 10/12/2018.
//  Copyright © 2018 Michał. All rights reserved.
//

import UIKit
import CoreLocation;
import MapKit;

class ViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    var clm: CLLocationManager?
    var pin: Pin?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        clm = CLLocationManager()
        clm?.requestAlwaysAuthorization()
        
        map.showsUserLocation = true
        map.userTrackingMode = .follow
    }
    
    @IBAction func ParkingButtonAction(_ sender: UIButton) {
        setPin();
        setRegion();
    }
    
    func setRegion(){
        if let pin = self.pin {
            let region = regionWithGeotification(coordinate: pin.coordinate);
            clm?.startMonitoring(for: region);
        }
    }

    func setPin(){
        map.removeAnnotations(map.annotations)
        if let location = CLLocationManager().location {
            self.pin = Pin(title: "Furmanka", coordinate: location.coordinate);
            if let pin = self.pin {
                map.addAnnotation(pin);
            }
        }
    }
    
    func regionWithGeotification(coordinate: CLLocationCoordinate2D) -> CLCircularRegion {
        let region = CLCircularRegion(center: coordinate, radius: 100.0, identifier: "Leniwa strefa");
        region.notifyOnExit = true;
        region.notifyOnEntry = true;
        return region;
    }
}

