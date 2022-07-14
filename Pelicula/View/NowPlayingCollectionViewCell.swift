//
//  NowPlayingCollectionViewCell.swift
//  Pelicula
//
//  Created by mcor on 11/07/22.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "nowPlayingCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup(title: String, image: UIImage, year: String) {
        titleLabel.text = title
        imageView.image = image
        dateLabel.text = year
    }
    
    
}



