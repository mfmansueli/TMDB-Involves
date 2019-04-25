//
//  UIViewController.swift
//  IMDBInvolves
//
//  Created By Mateus on 04/11/17.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import UIKit

extension UIViewController {

    func dismissKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = true
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    func findActiveTextField(_ subviews: [UIView]) -> CGRect? {
        for view in subviews {
            if let textField = view as? UITextField, textField.isFirstResponder {
                return textField.frame
            }
            
            return findActiveTextField(view.subviews)
        }
        return nil
    }

    func findTopMostViewController() -> UIViewController {
        return parent?.findTopMostViewController() ?? self
    }

    func add(_ child: UIViewController) {
        addChildViewController(child)
        view.addSubview(child.view)
        child.didMove(toParentViewController: self)
    }

    func remove() {
        guard parent != nil else {
            return
        }
        willMove(toParentViewController: nil)
        removeFromParentViewController()
        view.removeFromSuperview()
    }
}

extension UIViewController: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view is UIButton {
            return false
        }
        return true
    }
}
