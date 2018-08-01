//
//  PrimaryButton.swift
//  IMDBInvolves
//
//  Created By Mateus on 02/11/17.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import UIKit

class TextPrimaryButton: UIButton {

    override var intrinsicContentSize: CGSize {
        return CGSize(width: bounds.width, height: 30)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        titleColor = UIColor.App.primary
        titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }

    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1 : 0.5
        }
    }
}
