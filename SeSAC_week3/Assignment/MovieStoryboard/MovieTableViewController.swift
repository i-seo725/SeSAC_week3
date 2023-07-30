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
        cell.configureMovieCell(row: getMovieInfo)
        
        
        return cell
    }
    
}
