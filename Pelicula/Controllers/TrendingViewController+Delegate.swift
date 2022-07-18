//
//  TrendingViewController+Delegate.swift
//  Pelicula
//
//  Created by mcor on 17/07/22.
//

import UIKit

extension TrendingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie: Movie = trendingDayMovies[indexPath.row] // let movie: Movie = trendingWeekMovies[indexPath.row]
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
    }
    

}
