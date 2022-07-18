//
//  TrendingViewController.swift
//  Pelicula
//
//  Created by mcor on 17/07/22.
//

import UIKit

class TrendingViewController: UIViewController {
    
    var trendingDayMovies: [Movie] = []
    var trendingWeekMovies: [Movie] = []
    
    @IBOutlet var trendingTableView: UITableView!
    @IBOutlet var trendingSegmented: UISegmentedControl!
    

    @IBAction func segmentedChanged(_ sender: Any) {
        trendingTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trendingTableView.dataSource = self
        trendingTableView.delegate = self
        
        Task {
            self.trendingDayMovies = await Movie.trendingDayMoviesAPI()
            self.trendingTableView.reloadData()
        }
        
        Task {
            self.trendingWeekMovies = await Movie.trendingWeekMoviesAPI()
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
