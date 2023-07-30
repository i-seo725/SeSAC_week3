//
//  MovieTableViewCell.swift
//  SeSAC_week3
//
//  Created by 이은서 on 2023/07/29.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet var moviePosterImageView: UIImageView!
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieSubTitleLabel: UILabel!
    @IBOutlet var movieSummaryTextView: UITextView!
    
    func configureMovieCell(row: Movie) {
        movieTitleLabel.text = row.title
        movieSubTitleLabel.text = "\(row.releaseDate) | \(row.runtime)분 | \(row.rate)점"
        moviePosterImageView.image = UIImage(named: "\(row.title)")
        movieSummaryTextView.text = row.overview
        movieTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        movieSubTitleLabel.font = UIFont.systemFont(ofSize: 14)
    }

}
