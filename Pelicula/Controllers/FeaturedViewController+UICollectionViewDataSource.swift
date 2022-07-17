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
        
//        cell?.setup(title: popularMovies[indexPath.item].title, image: UIImage(named: popularMovies[indexPath.item].backdropPath) ?? UIImage())
        let movie = popularMovies[indexPath.item]
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
            let imagem = UIImage(data: imageData) ?? UIImage()
            cell?.setup(title: movie.title, image: imagem)

        }
        
        return cell ?? PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier , for: indexPath) as? NowPlayingCollectionViewCell
        
        let movie = nowPlayingMovies[indexPath.item]
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            let image = UIImage(data: imageData) ?? UIImage()
            
            let year: String = "\(movie.releaseDate.prefix(4))"
            cell?.setup(title: movie.title, image: image, year: year)
        }
//        
//        let year: String = "\(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))"
//        cell?.setup(title: nowPlayingMovies[indexPath.item].title,
//                    image: UIImage(named: nowPlayingMovies[indexPath.item].posterPath) ?? UIImage(),
//                    year: year)
        
        return cell ?? NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell
        
        let movie = upcomingMovies[indexPath.item]
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            let image = UIImage(data: imageData) ?? UIImage()
            
            let date: String = "\(movie.releaseDate.suffix(4))"
            cell?.setup(title: movie.title, image: image, date: date)
        }
        
//        let date: String = "\(upcomingMovies[indexPath.item].releaseDate.suffix(4))"
//
//        cell?.setup(title: upcomingMovies[indexPath.item].title,
//                    image: UIImage(named: upcomingMovies[indexPath.item].posterPath) ?? UIImage(),
//                    date: date)
        
        return cell ?? UpcomingCollectionViewCell()
    }
    
}
