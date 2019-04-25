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
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        UINavigationBar.appearance().titleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.white,
             NSAttributedStringKey.font: Font.systemRegularFontSize17]
        UINavigationBar.appearance().tintColor = UIColor.App.navigationBackground
        UINavigationBar.appearance().backgroundColor = UIColor.App.navigationBackground
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController?.navigationController?.interactivePopGestureRecognizer?.cancelsTouchesInView = false
        window?.rootViewController?.navigationController?.interactivePopGestureRecognizer?.delaysTouchesBegan = false
        window?.rootViewController?.navigationController?.interactivePopGestureRecognizer?.delaysTouchesEnded = false
        window?.rootViewController?.navigationController?.setNavigationBarHidden(false, animated: true)
        window?.rootViewController?.navigationController?.navigationBar.isHidden = false
        window?.rootViewController = UINavigationController(rootViewController: MoviesViewController())
        window?.backgroundColor = UIColor.App.background
        window?.makeKeyAndVisible()

        return true
    }
}
