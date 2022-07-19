//
//  TrendingViewController+Delegate.swift
//  Pelicula
//
//  Created by mcor on 17/07/22.
//

import UIKit

extension TrendingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movieDay: Movie = trendingDayMovies[indexPath.row]
        let movieWeek: Movie = trendingWeekMovies[indexPath.row]
        switch trendingSegmented.selectedSegmentIndex{
        case 0:
            return self.performSegue(withIdentifier: "detailsSegue", sender: movieDay)
        case 1:
            return self.performSegue(withIdentifier: "detailsSegue", sender: movieWeek)
        default:
            break
            
        }
        
    }
    

}
