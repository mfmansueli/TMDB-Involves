//
//  DetailMovieViewController.swift
//  IMBDInvolves
//
//  Created by Mateus on 02/08/2018.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import UIKit

class DetailMovieViewController: ViewController {

    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    var image: UIImage?
    var movie: Movie!
    
    convenience init(image: UIImage?, movie: Movie) {
        self.init()
        self.image = image
        self.movie = movie
    }
    
    override func prepare() {
        view.backgroundColor = UIColor.App.background
        headerImageView.image = image
        headerImageView.contentMode = .scaleAspectFit
        
        titleLabel.text = movie.title
        titleLabel.font = Font.systemBoldFontSize24
        titleLabel.textColor = UIColor.white
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        
        dateLabel.text = R.string.localizable.movieReleaseDateLabel(
            movie.releaseDate.formattedDateFromString(
            currentFormat: R.string.localizable.webFormat(),
            withFormat: R.string.localizable.visualDate()))
        dateLabel.font = Font.systemRegularFontSize14
        dateLabel.textColor = UIColor.white
        
        synopsisLabel.text = movie.overview
        synopsisLabel.numberOfLines = 0
        synopsisLabel.lineBreakMode = .byWordWrapping
        
        genderLabel.font = Font.systemRegularFontSize14
        genderLabel.textColor = UIColor.white
        genderLabel.text = ""
    }

    override func bindViewModel() {
        super.bindViewModel()
    }
}
