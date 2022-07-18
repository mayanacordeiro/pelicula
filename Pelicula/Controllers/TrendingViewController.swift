//
//  TrendingViewController.swift
//  Pelicula
//
//  Created by mcor on 17/07/22.
//

import UIKit

class TrendingViewController: UIViewController {
    
    var trendingDayMovies: [Movie] = []
    
    @IBOutlet var trendingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trendingTableView.dataSource = self
        trendingTableView.delegate = self
        
        Task {
            self.trendingDayMovies = await Movie.trendingDayMoviesAPI()
            self.trendingTableView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
            
        }
        
    }
    
    
}
