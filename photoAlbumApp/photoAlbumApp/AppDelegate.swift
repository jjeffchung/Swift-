//
//  AppDelegate.swift
//  photoAlbumApp
//  A Photo Album application which requires access to the Photo Library to display photos from the device. The user can swipe up and down to go through the photos and to double tap with two fingers to zoom in and out.
//  Created by John Jeffrey Chung on 7/11/18.
//  Copyright © 2018 John Jeffrey Chung. All rights reserved.
//

import UIKit
import Photos

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var display: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let photos = PHPhotoLibrary.authorizationStatus() //The Photo Album app needs the user's permission to access the Photo Library.
        if photos == .notDetermined {
            PHPhotoLibrary.requestAuthorization({status in
                if status == .authorized{
                    self.headToViewController()
                } else {      //if user does not allow access to the Photo Library, the app will not run and the following code will run.
                    let alert = UIAlertController(title: "Photos Access Denied", message: "App needs access to photos library.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.display?.rootViewController?.present(alert, animated: true, completion: nil)
                }
            })
        } else if photos == .authorized { //The Photo Library Authorization Status has to be authorized in order to proceed.
            headToViewController()
        }
        return true
    }
    
    func headToViewController() {
        DispatchQueue.main.async(execute: { () -> Void in
            self.display = UIWindow(frame: UIScreen.main.bounds)
            if let display = self.display {
                display.backgroundColor = UIColor.white
                
                let nav = UINavigationController()
                let mainView = ViewController()
                nav.viewControllers = [mainView]
                display.rootViewController = nav
                display.makeKeyAndVisible()
            }
        })
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

