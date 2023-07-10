//
//  MovieDetailsView.swift
//
//  Created by AhmedFitoh on 7/9/23.
//  
//

import UIKit

class MovieDetailsView: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var posterBackgroundImageView: UIImageView!
    
    @IBOutlet weak var movieInfoLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var genereLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var spokenLangsLabel: UILabel!
    
    
    // MARK: - VIPER Stack
    var presenter: MovieDetailsViewToPresenterProtocol!
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidFinishLoading()
    }
    
    private func setupUI(){
        setupPosterImageView()
    }
    
    private func setupPosterImageView(){
        posterImageView.layer.cornerRadius = 5
    }
}

// MARK: - Presenter to View Protocol
extension MovieDetailsView: MovieDetailsPresenterToViewProtocol {
    
    func showPreloadedInfo() {
        navigationItem.title = presenter?.movie.movieName
        posterImageView.loadImageUsingCache(withUrl: ImageUrlBuilder.getUrl(stringUrl: presenter?.movie.posterPath, size: .w92))
        posterBackgroundImageView.loadImageUsingCache(withUrl: ImageUrlBuilder.getUrl(stringUrl: presenter?.movie.posterPath, size: .w500))
        overviewLabel.text = presenter?.movie?.overview
    }

    func showExternalInfo() {
        guard let details = presenter?.movieDetails else {
            return
        }
        let productionCompanies = details.productionCompanies?.compactMap {$0.name}.joined(separator: "\n") ?? ""
        movieInfoLabel.text = "\(details.releaseDate ?? "")\n\(details.runtime ?? 0) Mins\n\(productionCompanies)"
        genereLabel.text = details.genres.compactMap {$0.name}.joined(separator: "\n")
        statusLabel.text = details.status
        spokenLangsLabel.text = details.spokenLanguages.compactMap{$0.englishName}.joined(separator: "\n")
    }
}
