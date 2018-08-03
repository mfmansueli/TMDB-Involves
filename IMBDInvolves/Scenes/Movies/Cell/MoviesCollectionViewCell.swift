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
    
    weak var delegate: MoviesCollectionCellDelegate?
    var movie: Movie!
    
    func setup(with item: Movie) {
        self.movie = item
        cellView.backgroundColor = UIColor.App.background
        
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = Constants.lines
        titleLabel.font = Font.systemBoldFontSize17
        titleLabel.textColor = UIColor.white
        titleLabel.text = item.title
        
        dateLabel.font = Font.systemRegularFontSize14
        dateLabel.textColor = UIColor.white
        dateLabel.text = R.string.localizable.movieReleaseDateLabel(
            item.releaseDate.formattedDateFromString(
                currentFormat: R.string.localizable.webFormat(),
                withFormat: R.string.localizable.visualDate()))
        
        movieImageView.kf.indicatorType = .activity
        if let posterPath = item.posterPath {
        movieImageView.kf.setImage(with: URL(string: R.string.localizable.baseUrlImage(posterPath)))
        }
        movieImageView.contentMode = .scaleAspectFit
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(movieTapped))
        cellView.addGestureRecognizer(tapGesture)
    }
    
    @objc func movieTapped() {
        delegate?.movieTapped(on: movie, image: movieImageView.image)
    }
}
