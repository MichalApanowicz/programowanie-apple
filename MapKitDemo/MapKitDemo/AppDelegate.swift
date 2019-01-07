//
//  AppDelegate.swift
//  MapKitDemo
//
//  Created by Michał on 10/12/2018.
//  Copyright © 2018 Michał. All rights reserved.
//

import UIKit
import CoreLocation;
import MapKit;
import UserNotifications;

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    var clm: CLLocationManager?

    func notify(){
        let title = "Lokalizator leniwej strefy"
        let message = "Opuszczasz leniwą strefę! Będziesz za dużo chodził. Wróć i pojedź autem."
        if (UIApplication.shared.applicationState == .active){
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert);
            alertController.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default));
            window?.rootViewController?.present(alertController, animated: true, completion: nil);
        } else {
            let content = UNMutableNotificationContent()
            content.title = title;
            content.body = message;
            content.sound = UNNotificationSound.default
            let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 0.1, repeats: false);
            let no = UNNotificationRequest(identifier: "No", content: content, trigger: trigger);
            UNUserNotificationCenter.current().add(no, withCompletionHandler: nil)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        notify()
        print("didEnter")
    }
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("did Enter")
        notify()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        clm = CLLocationManager()
        clm?.requestAlwaysAuthorization()
        clm?.delegate = self
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound], completionHandler: {error, argument2 in });
       // application.registerUserNotificationSettings(UIUserNotificationSettings(types: UIUserNotificationType.alert, categories: nil))
        //UIApplication.cancelAllLocalNotifications(application);
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

