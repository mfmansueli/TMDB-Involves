//
//  NibLoadable.swift
//  IMDBInvolves
//
//  Created By Mateus on 24/01/18.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import UIKit

protocol NibLoadable: class {}

extension NibLoadable where Self: UIView {
    static var nibBundle: Bundle {
        return Bundle(for: self)
    }

    static var nibName: String {
        return String(describing: self)
    }

    static func loadFromNib(withOwner owner: Any?) -> Self {
        guard let view = nibBundle.loadNibNamed(nibName, owner: owner, options: nil)?.first as? Self else {
            fatalError("Could not load nib named '\(nibName)'.")
        }
        return view
    }
}
