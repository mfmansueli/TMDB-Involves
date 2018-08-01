//
//  UIView.swift
//  IMDBInvolves
//
//  Created By Mateus on 02/11/17.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import UIKit

extension UIView {

    var shadowColor: UIColor? {
        get {
            guard let v = layer.shadowColor else {
                return nil
            }

            return UIColor(cgColor: v)
        }

        set(value) {
            layer.shadowColor = value?.cgColor
        }
    }

    var borderColor: UIColor? {
        get {
            guard let v = layer.borderColor else {
                return nil
            }

            return UIColor(cgColor: v)
        }

        set(value) {
            layer.borderColor = value?.cgColor
        }
    }

    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }

        set(value) {
            layer.borderWidth = borderWidth
        }
    }

    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }

        set(value) {
            layer.cornerRadius = value
        }
    }

}
