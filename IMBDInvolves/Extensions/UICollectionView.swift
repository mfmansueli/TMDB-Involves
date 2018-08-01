//
//  UICollectionView.swift
//  IMDBInvolves
//
//  Created By Mateus on 24/01/18.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import UIKit

extension UICollectionView {

    func register<Cell: UICollectionViewCell>(_: Cell.Type) where Cell: NibLoadable {
        let nib = UINib(nibName: Cell.nibName, bundle: Cell.nibBundle)
        register(nib, forCellWithReuseIdentifier: Cell.reuseIdentifier)
    }

    func dequeueReusableCell<Cell: UICollectionViewCell>(_: Cell.Type, for indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(
            withReuseIdentifier: Cell.reuseIdentifier,
            for: indexPath
            ) as? Cell else {
                fatalError("Could not dequeue cell with reuseIdentifier '\(Cell.reuseIdentifier)'.")
        }
        return cell
    }

}
