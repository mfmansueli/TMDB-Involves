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

    struct Constants {
        static let lines = 0
        static let animationDuration = 0.3
    }
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var sinopseLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionMovieView: UIView!
    
    weak var delegate: MoviesCollectionCellDelegate?
    var movie: Movie!
    
    func setup(with item: Movie) {
        self.movie = item
        
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = Constants.lines
        titleLabel.font = Font.systemBoldFontSize17
        titleLabel.textColor = UIColor.App.primary
        titleLabel.text = item.title
        
        dateLabel.text = item.releaseDate
        
        movieImageView.kf.indicatorType = .activity
        if let posterPath = item.posterPath {
        movieImageView.kf.setImage(with: URL(string: R.string.localizable.baseUrlImage(posterPath)))
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(movieTapped))
        cellView.addGestureRecognizer(tapGesture)
    }
    
    @objc func movieTapped() {
        movie.isSelected = !movie.isSelected
        let height = movie.isSelected
            ? self.descriptionMovieView.frame.height
            : -self.descriptionMovieView.frame.height
        
        let animator = UIViewPropertyAnimator(duration: Constants.animationDuration,
                                              timingParameters: UICubicTimingParameters(animationCurve: .easeOut))
        animator.addAnimations {
            self.frame = CGRect(x: self.frame.origin.x,
                                y: self.frame.origin.y,
                                width: self.frame.width,
                                height: (self.frame.height + height))
            self.descriptionMovieView.isHidden = !self.descriptionMovieView.isHidden
        }
        animator.startAnimation()
        delegate?.movieTapped(on: movie)
    }
}
