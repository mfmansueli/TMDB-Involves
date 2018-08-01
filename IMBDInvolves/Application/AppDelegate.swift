//
//  AppDelegate.swift
//  IMDBInvolves
//
//  Created By Mateus on 26/10/17.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
        ) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.tintColor = UIColor.gray

        Application.shared.configureRootViewController(in: window)

        self.window = window
        window.makeKeyAndVisible()

        return true
    }
}
