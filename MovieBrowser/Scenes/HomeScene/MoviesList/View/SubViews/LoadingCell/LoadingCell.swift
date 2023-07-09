//
//  LoadingCell.swift
//  MoviesApp
//
//  Created by AhmedFitoh on 7/8/23.
//

import UIKit

class LoadingCell: UITableViewCell {

 
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func prepareForReuse() {
        activityIndicator.startAnimating()
    }
}
