//
//  HeadLinesCell.swift
//
//  Created by AhmedFitoh on 7/8/23.
//

import UIKit

class MoviesListCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI(){
        posterImageView.layer.cornerRadius = 5
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
    }

    func setupCellWith(movie: MovieModel, indexPath: IndexPath){
        titleLabel.text = movie.movieName
        if let releaseDate = movie.releaseDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            if let date = dateFormatter.date(from: releaseDate) {
                dateFormatter.dateFormat = "yyyy"
                yearLabel.text = dateFormatter.string(from: date)
                yearLabel.isHidden = false
            } else {
                yearLabel.isHidden = true
            }
        } else {
            yearLabel.isHidden = true
        }
        descLabel.text = movie.overview
        posterImageView.loadImageUsingCache(
            withUrl: ImageUrlBuilder.getUrl(
                stringUrl: movie.posterPath,
                size: .w92),
            cellIndexPathRow: indexPath.row)
    }

}
