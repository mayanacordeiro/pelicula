//
//  TrendingCellTableViewCell.swift
//  Pelicula
//
//  Created by mcor on 17/07/22.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {

    static let cellIdentifier = "trendingCell"
    
    @IBOutlet var posterView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup(title: String, image: UIImage, year: String) {
        titleLabel.text = title
        posterView.image = image
        dateLabel.text = year
    }
    
}
