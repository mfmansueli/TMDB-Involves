//
//  UIButton.swift
//  IMDBInvolves
//
//  Created By Mateus on 26/10/17.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import UIKit

extension UIButton {
    var title: String? {
        get {
            return title(for: .normal)
        }

        set(value) {
            setTitle(value, for: .normal)
            setTitle(value, for: .highlighted)
        }
    }

    var titleColor: UIColor? {
        get {
            return titleColor(for: .normal)
        }

        set(value) {
            setTitleColor(value, for: .normal)
            setTitleColor(value, for: .highlighted)
        }
    }

    var selectedTitleColor: UIColor? {
        get {
            return titleColor(for: .selected)
        }

        set(value) {
            setTitleColor(value, for: .selected)
        }
    }

    var disabledTitleColor: UIColor? {
        get {
            return titleColor(for: .disabled)
        }

        set(value) {
            setTitleColor(value, for: .disabled)
        }
    }
}
