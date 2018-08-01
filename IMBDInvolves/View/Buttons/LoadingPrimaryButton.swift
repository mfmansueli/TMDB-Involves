//
//  LoadingPrimaryButton.swift
//  IMDBInvolves
//
//  Created By Mateus on 02/11/17.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoadingPrimaryButton: PrimaryButton {

    var isAnimating: Bool = false {
        didSet {
            if isAnimating {
                originalTitle = title
                title = ""
                activityIndicator.startAnimating()
            } else {
                if originalTitle != nil {
                    title = originalTitle
                }
                activityIndicator.stopAnimating()
            }
            isEnabled = !isAnimating
        }
    }

    private var originalTitle: String?
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(activityIndicatorStyle: .white)
        ai.hidesWhenStopped = true
        return ai
    }()

    override func layoutSubviews() {
        super.layoutSubviews()

        addSubview(activityIndicator)
        activityIndicator.center = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
    }
}

extension Reactive where Base: LoadingPrimaryButton {
    var isAnimating: Binder<Bool> {
        return Binder(self.base) { button, isAnimating in
            button.isAnimating = isAnimating
        }
    }
}
