//
//  PrimaryTextField.swift
//  IMDBInvolves
//
//  Created By Mateus on 02/11/17.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import UIKit

class PrimaryBottomBorderTextField: UITextField {

    override var intrinsicContentSize: CGSize {
        return CGSize(width: bounds.width, height: 40)
    }

    override var tintColor: UIColor! {
        didSet {
            setNeedsDisplay()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        borderStyle = .none
        font = UIFont.systemFont(ofSize: 15, weight: .medium)
        textAlignment = .center
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let startingPoint = CGPoint(x: rect.minX, y: rect.maxY)
        let endingPoint = CGPoint(x: rect.maxX, y: rect.maxY)

        let path = UIBezierPath()

        path.move(to: startingPoint)
        path.addLine(to: endingPoint)
        path.lineWidth = 1.0

        tintColor.setStroke()

        path.stroke()
    }
}
