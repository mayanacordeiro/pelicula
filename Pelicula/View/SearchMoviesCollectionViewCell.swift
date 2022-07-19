//
//  SearchMoviesCollectionViewCell.swift
//  Pelicula
//
//  Created by mcor on 18/07/22.
//

import UIKit

class SearchMoviesCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "searchCell"
    
    @IBOutlet var imageView: UIImageView!
    
    func setup(image: UIImage) {
        imageView.image = image 
    }
}
