//
//  pickerItem.swift
 // BRAIN POWER
//
//
//  Created by Rebero Prince on 12/3/19.
//  Copyright © 2019 University of Rochester. All rights reserved.
//
 
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) {
        CoreDataStack.shared.saveContext()
    }
}

