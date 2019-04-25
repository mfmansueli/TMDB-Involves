//
//  Application.swift
//  IMDBInvolves
//
//  Created By Mateus on 26/10/17.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import UIKit

final class Application {
    static let shared = Application()

    private init() {}

    func configureRootViewController(in window: UIWindow) {
        window.rootViewController = MoviesViewController()
        window.rootViewController?.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
