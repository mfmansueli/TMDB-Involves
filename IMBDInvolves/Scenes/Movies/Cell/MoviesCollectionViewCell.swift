//
//  MoviesCollectionViewCell.swift
//  IMBDInvolves
//
//  Created by Mateus on 11/07/2018.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellView: UIView!
    struct Constants {
        static let baseImageURL = "https://image.tmdb.org/t/p/w500"
    }
    weak var delegate: MoviesCollectionCellDelegate?
    var movie: Movie!
    
    func setup(with item: Movie) {
        self.movie = item
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(movieTapped))
        cellView.addGestureRecognizer(tapGesture)
    }
    
    @objc func movieTapped() {
        delegate?.movieTapped(on: movie)
    }
}
