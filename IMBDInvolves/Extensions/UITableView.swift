//
//  UITableView.swift
//  IMDBInvolves
//
//  Created By Mateus on 24/01/18.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import UIKit

extension UITableView {
    func register<Cell: UITableViewCell>(_: Cell.Type) where Cell: NibLoadable {
        let nib = UINib(nibName: Cell.nibName, bundle: Cell.nibBundle)
        register(nib, forCellReuseIdentifier: Cell.reuseIdentifier)
    }

    func dequeueReusableCell<Cell: UITableViewCell>(_: Cell.Type, for indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(
            withIdentifier: Cell.reuseIdentifier,
            for: indexPath
            ) as? Cell else {
                fatalError("Could not dequeue cell with reuseIdentifier '\(Cell.reuseIdentifier)'.")
        }
        return cell
    }
}
