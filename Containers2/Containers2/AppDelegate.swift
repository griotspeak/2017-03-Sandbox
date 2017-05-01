//
//  AppDelegate.swift
//  Containers2
//
//  Created by TJ Usiyan on 2017/04/26.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let redVC = RedViewController()
        let blueVC = BlueViewController()
        let greenVC = GreenViewController()

        let greenStack = UINavigationController(rootViewController: greenVC)
        greenStack.tabBarItem.title = "Green!"
        let tabBarVC = UITabBarController()
        tabBarVC.setViewControllers([redVC, blueVC, greenStack], animated: false)

        window!.rootViewController = tabBarVC
        window!.makeKeyAndVisible()

        return true
    }
}

