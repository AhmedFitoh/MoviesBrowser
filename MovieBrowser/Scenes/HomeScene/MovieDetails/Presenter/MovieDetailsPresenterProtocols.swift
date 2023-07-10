//
//  MovieDetailsPresenterProtocols.swift
//
//  Created by AhmedFitoh on 7/9/23.
//
//

// VIPER Protocol to the Module
protocol MovieDetailsDelegate: AnyObject {
    
}

// VIPER Protocol for communication from Interactor -> Presenter
protocol MovieDetailsInteractorToPresenterProtocol: AnyObject {
    func fetchMovieDetailsSuccess(model: MovieDetailsModel)
    func fetchMovieDetailsFailure(error: Error?)
}

// VIPER Protocol for communication from View -> Presenter
protocol MovieDetailsViewToPresenterProtocol: AnyObject {
    var movie: MovieModel! {get}
    var movieDetails: MovieDetailsModel? {get}

    func viewDidFinishLoading()
}
