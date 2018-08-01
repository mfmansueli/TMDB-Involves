//
//  MoviesCollectionCellDelegate.swift
//  IMBDInvolves
//
//  Created by Mateus on 31/07/2018.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import UIKit

protocol MoviesCollectionCellDelegate: class {
    func movieTapped(on movie: Movie)
}
