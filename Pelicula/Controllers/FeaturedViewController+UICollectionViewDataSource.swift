//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  Pelicula
//
//  Created by mcor on 12/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.popularCollectionView {
            return popularMovies.count
        } else if collectionView == self.nowPlayingCollectionView {
            return nowPlayingMovies.count
        } else if collectionView == self.upcomingCollectionView {
            return upcomingMovies.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.popularCollectionView {
            return makePopularCell(indexPath)
        } else if collectionView == self.nowPlayingCollectionView {
            return makeNowPlayingCell(indexPath)
        } else if collectionView == self.upcomingCollectionView {
            return makeUpcomingCell(indexPath)
        } else {
            return UICollectionViewCell()
        }
        
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier , for: indexPath) as? PopularCollectionViewCell
        
        let movie = popularMovies[indexPath.item]
        
        cell?.setup(title: movie.title, image: UIImage())
        Task {
            let imageData = await Movie.downloadImageData(withPath: (movie.backdropPath ?? ""))
            let imagem = UIImage(data: imageData) ?? UIImage()
            cell?.setup(title: movie.title, image: imagem)

        }
        
        return cell ?? PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier , for: indexPath) as? NowPlayingCollectionViewCell
        
        let movie = nowPlayingMovies[indexPath.item]
        let year: String = "\(movie.releaseDate.prefix(4))"
       
        cell?.setup(title: movie.title, image: UIImage(), year: year)
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: (movie.posterPath ?? ""))
            let image = UIImage(data: imageData) ?? UIImage()
            
           
            cell?.setup(title: movie.title, image: image, year: year)
        }

        
        return cell ?? NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell
        
        
        let movie = upcomingMovies[indexPath.item]
        
        let date: String = "\(movie.releaseDate.prefix(4))"
        cell?.setup(title: movie.title, image: UIImage(), date: date)
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: (movie.posterPath ?? ""))
            let image = UIImage(data: imageData) ?? UIImage()
            
//            let date: String = "\(movie.releaseDate.suffix(4))"
            cell?.setup(title: movie.title, image: image, date: date)
        }
        
        return cell ?? UpcomingCollectionViewCell()
    }
    
}
