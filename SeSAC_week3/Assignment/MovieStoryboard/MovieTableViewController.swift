//
//  MovieTableViewController.swift
//  SeSAC_week3
//
//  Created by 이은서 on 2023/07/29.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    let movieInformation = MovieInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 150
    }
    
    //셀 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieInformation.movie.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as! MovieTableViewCell
        
        let getMovieInfo = movieInformation.movie[indexPath.row]
        cell.moviePosterImageView.image = UIImage(named: "\(getMovieInfo.title)")
        cell.movieTitleLabel.text = getMovieInfo.title
        cell.movieTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        cell.movieSubTitleLabel.text = "\(getMovieInfo.releaseDate) | \(getMovieInfo.runtime)분 | \(getMovieInfo.rate)점"
        cell.movieSubTitleLabel.font = UIFont.systemFont(ofSize: 14)
        cell.movieSummaryTextView.text = "\(getMovieInfo.overview)"
        
        return cell
    }
    
}
