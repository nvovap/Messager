//
//  AppDelegate.swift
//  Messager
//
//  Created by Vladimir Nevinniy on 19.03.17.
//  Copyright © 2017 Vladimir Nevinniy. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FIRApp.configure()
        
        if let firebaseAuth = FIRAuth.auth(), let currentUser = firebaseAuth.currentUser  {
            
            
            print(firebaseAuth)
            print(currentUser.uid)
            
            
            //+++++++ signing out ++++++++++++
            do {
                try firebaseAuth.signOut()
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
            //--------------------------------
            
            
        } else {
        
            let customToken = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiIrMTIzNDU2Nzg5MDEiLCJpYXQiOjE0OTAwMTk3ODcsImV4cCI6MTQ5MDAyMzM4NywiYXVkIjoiaHR0cHM6Ly9pZGVudGl0eXRvb2xraXQuZ29vZ2xlYXBpcy5jb20vZ29vZ2xlLmlkZW50aXR5LmlkZW50aXR5dG9vbGtpdC52MS5JZGVudGl0eVRvb2xraXQiLCJpc3MiOiJtZXNzYWdlcm52b3ZhcEBhcHBzcG90LmdzZXJ2aWNlYWNjb3VudC5jb20iLCJzdWIiOiJtZXNzYWdlcm52b3ZhcEBhcHBzcG90LmdzZXJ2aWNlYWNjb3VudC5jb20ifQ.aCrpGkLVMd0vdrxqmRc4RnLuxMaR3dimUf2PEVhvkSv1sq0Qgd0P0EEXsiv602-XljEyaS9HqcKlJXHJgG2CEqT-0YWgrP-QBrw16VRGpPLTMxkYAgPFttZ3B5odYlEtHHIUesmEAPFXVlDe_mRu3SXSH3H9pfv0f1YQpU0TTWrnlHBv95UbLkiAE2zlqfrrVgbGAgyIvTPvMTWOjd5JfEe6EUtXs3o1wZT3BJ1OibK5nhcrVe2FzC4fWHlDlJbm567zHbFzDyvxK8TcVanN7dM_NNUBo3tsEQ9dRbzERfTackdyIhbkxQoIjhSHpp2xwSejyjVVxbRDxLB0r5zfyg"
            
            
            FIRAuth.auth()?.signIn(withCustomToken: customToken) { (user, error) in
                print(error ?? "")
                
                print(user ?? "")
                
                print(user?.uid ?? "")
                
            }
        }
        
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

