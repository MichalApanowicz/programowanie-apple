//
//  ViewController.swift
//  world-weather
//
//  Created by Michał on 07/01/2019.
//  Copyright © 2019 Michał. All rights reserved.
//

import UIKit
import Reachability

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var city_picker: UIPickerView!

    let cities =  ["Bydgoszcz", "Torun", "Gdansk", "Warszawa", "Berlin"]
    var city :String = "Bydgoszcz"
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.cities.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.city = self.cities[row];
        self.showCurrentWeather(city: self.city);
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.cities[row]
    }
    
    var r : Reachability?
    var online = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        self.city_picker.delegate = self
        self.city_picker.dataSource = self

        self.r = Reachability();
        
        self.r?.whenReachable = {
            reachability in
                self.online = true;
                print ("Online")
            
        }
        
        self.r?.whenUnreachable = {
            reachability in
                self.online = false;
                print ("Offline")
        }
        
        do {
            try self.r?.startNotifier()
        } catch {
            print("ERROR - Reachability")
        }
    }
    
    @IBOutlet weak var weather_description: UITextView!
    @IBOutlet weak var weather_image: UIImageView!
    
    func showCurrentWeather(city: String){
        if(city == "" || !self.online) {
            weather_description.text = "Brak połączenia z Internetem";
            weather_image.image = getImage(weather: "error")
            return;
        }
        let desc = loadData(city: city)
        weather_description.text = desc;
        if(desc != "ERROR") {
            weather_image.image = getImage(weather: desc)
        }
    }
    
    func loadData(city: String) -> String{
        let address = "http://api.openweathermap.org/data/2.5/weather?q=\(city),pl&APPID=7eb03a29be8a7b93b78efa9dda943c8b"
        
        if let url = URL(string: address){
            do{
                let content = try String(contentsOf: url)
                if let d = content.data(using: .utf8){
                    let res = try! JSONDecoder().decode(Response.self, from: d);
                    print(res)
                    return res.weather[0].main;
                }
            } catch {
                print("ERROR")
                return "ERROR"
            }
        }
        return "ERROR"
    }

    func getImage(weather: String) -> UIImage {
        return UIImage(named: weather)!
    }
}

struct Response : Codable {
    let weather: [Weather]
}
struct Weather : Codable {
    let main:String
}
