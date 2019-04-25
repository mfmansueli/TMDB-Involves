//
//  UIAlertController.swift
//  IMDBInvolves
//
//  Created By Mateus on 24/01/18.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import UIKit

extension UIAlertController {

    static func presentActionSheet(
        in viewController: UIViewController,
        title: String?,
        message: String?,
        actions: [UIAlertAction] = [],
        completion: (() -> Void)? = nil
        ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        actions.forEach(alertController.addAction)
        viewController.present(alertController, animated: true, completion: completion)
    }

    static func presentAlert(
        in viewController: UIViewController,
        title: String?,
        message: String?,
        actions: [UIAlertAction] = [],
        completion: (() -> Void)? = nil
        ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach(alertController.addAction)
        viewController.present(alertController, animated: true, completion: completion)
    }

    static func presentDefaultAlert(
        in viewController: UIViewController,
        title: String?,
        message: String?,
        completion: (() -> Void)? = nil
        ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        viewController.present(alertController, animated: true, completion: completion)
    }
}
