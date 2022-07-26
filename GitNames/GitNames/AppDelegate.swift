//
//  AppDelegate.swift
//  GitNames
//
//  Created by ESB21632 on 2022/7/26.
//

import UIKit
@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigation = UINavigationController(rootViewController: RootViewController())
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        return true
    }
}
