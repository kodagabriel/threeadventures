//
//  AppDelegate.swift
//  threeadventures
//
//  Created by Koda Gabriel on 27/02/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
    -> Bool {
        // Override point for customization after application launch.
        let coordinator = MainCoordinator()
        window = coordinator.getWindow()
        coordinator.start()
        return true
    }
}
