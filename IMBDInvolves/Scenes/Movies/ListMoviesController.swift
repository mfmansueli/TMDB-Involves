//
//  ListMoviesController.swift
//  IMBDInvolves
//
//  Created by Mateus on 31/07/2018.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import UIKit
import IGListKit

class ListMoviesController: ListSectionController {
    
    struct Constants {
        static let cellHeight = CGFloat(140)
    }
    var object: Movie!
    weak var delegate: MoviesViewController!
    let itemsSize: Int = 1
    
    override func numberOfItems() -> Int {
        return itemsSize
    }
    
    static func instantiate(delegate: MoviesViewController) -> ListMoviesController {
        let viewController = ListMoviesController()
        viewController.delegate = delegate
        return viewController
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: Constants.cellHeight)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext?.dequeueReusableCell(withNibName: R.nib.moviesCollectionViewCell.name,
                                                          bundle: nil, for: self, at: index) as! MoviesCollectionViewCell
        cell.setup(with: object)
        cell.delegate = delegate
        return cell
    }
    
    
    override func didUpdate(to object: Any) {
        assert(object is Movie)
        self.object = object as? Movie
    }
}
