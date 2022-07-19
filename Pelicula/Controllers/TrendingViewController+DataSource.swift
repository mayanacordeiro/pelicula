//
//  TrendingViewController+DataSource.swift
//  Pelicula
//
//  Created by mcor on 17/07/22.
//

import UIKit

extension TrendingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch trendingSegmented.selectedSegmentIndex {
        case 0:
            return trendingDayMovies.count
        case 1:
            return trendingWeekMovies.count
            
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trendingCell") as? TrendingTableViewCell
        
        switch trendingSegmented.selectedSegmentIndex {
        case 0:
            let movie = trendingDayMovies[indexPath.item]
            
            Task {
                let imageData = await Movie.downloadImageData(withPath: (movie.posterPath ?? ""))
                let image = UIImage(data: imageData) ?? UIImage()
                
                let year: String = "\(movie.releaseDate.prefix(4))"
                cell?.setup(title: movie.title, image: image, year: year)
            }
        case 1:
            let movie = trendingWeekMovies[indexPath.item]
            Task {
                let imageData = await Movie.downloadImageData(withPath: (movie.posterPath ?? ""))
                let image = UIImage(data: imageData) ?? UIImage()
                
                let year: String = "\(movie.releaseDate.prefix(4))"
                cell?.setup(title: movie.title, image: image, year: year)
            }
        default:
            break
            
        }
        
        return cell ?? TrendingTableViewCell()
    }
    
    
}
