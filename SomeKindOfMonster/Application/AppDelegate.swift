//
//  AppDelegate.swift
//  SomeKindOfMonster
//
//  Created by Baby on 3/5/18.
//  Copyright © 2018 Baby. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print(UserDefaults.standard.value(forKey: "IsTrue") ?? "UNKNOWN")
        UserDefaults.standard.set(true, forKey: "IsTrue")
        return true
    }

}

