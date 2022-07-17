//
//  UpcomingCollectionViewCell.swift
//  Pelicula
//
//  Created by mcor on 11/07/22.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "upcomingCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup(title: String, image: UIImage, date: String){
        titleLabel.text = title
        imageView.image = image
        dateLabel.text = date
    }
}
