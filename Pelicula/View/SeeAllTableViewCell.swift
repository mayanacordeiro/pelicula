//
//  SeeAllTableViewCell.swift
//  Pelicula
//
//  Created by mcor on 19/07/22.
//

import UIKit

class SeeAllTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "seeAllCell"
    
    @IBOutlet var photoView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var notaLabel: UILabel!
    
    
    func setup(image: UIImage, title: String, year: String, rating: String) {
        photoView.image = image
        titleLabel.text = title
        dateLabel.text = year
        notaLabel.text = rating
    }
    

}
