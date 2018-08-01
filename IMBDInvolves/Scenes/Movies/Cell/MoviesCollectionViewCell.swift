//
//  MoviesCollectionViewCell.swift
//  IMBDInvolves
//
//  Created by Mateus on 11/07/2018.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import UIKit
import Kingfisher

class MoviesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var cellView: UIView!
    
    weak var delegate: MoviesCollectionCellDelegate?
    var movie: Movie!
    
    func setup(with item: Movie) {
        self.movie = item
        
        movieImageView.kf.indicatorType = .activity
        if let posterPath = item.posterPath {
        movieImageView.kf.setImage(with: URL(string: R.string.localizable.baseUrlImage(posterPath)))
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(movieTapped))
        cellView.addGestureRecognizer(tapGesture)
    }
    
    @objc func movieTapped() {
        delegate?.movieTapped(on: movie)
    }
}
