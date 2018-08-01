//
//  PrimaryButton.swift
//  IMDBInvolves
//
//  Created By Mateus on 02/11/17.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import UIKit

class PrimaryButton: UIButton {

    override var intrinsicContentSize: CGSize {
        return CGSize(width: bounds.width, height: 40)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        backgroundColor = UIColor.App.primary
        titleColor = UIColor.white
        cornerRadius = 4
        titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
    }

    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1 : 0.5
        }
    }
}
