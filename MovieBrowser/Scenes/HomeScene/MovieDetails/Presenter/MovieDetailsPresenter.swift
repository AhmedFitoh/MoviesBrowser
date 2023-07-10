//
//  MovieDetailsPresenter.swift
//
//  Created by AhmedFitoh on 7/9/23.
//  
//

import Foundation

final class MovieDetailsPresenter {
    
    // MARK: - VIPER Stack
    weak var view: MovieDetailsPresenterToViewProtocol!
    var interactor: MovieDetailsPresenterToInteractorProtocol!
    var wireframe: MovieDetailsPresenterToWireframeProtocol!
    
    // MARK: - Instance Variables
    weak var delegate: MovieDetailsDelegate?
    var movie: MovieModel!
    var movieDetails: MovieDetailsModel?
    
    // MARK: - Life Cycle
    init(movie: MovieModel,
         wireframe: MovieDetailsPresenterToWireframeProtocol,
         view: MovieDetailsPresenterToViewProtocol,
         interactor: MovieDetailsPresenterToInteractorProtocol,
         delegate: MovieDetailsDelegate? = nil) {
        self.wireframe = wireframe
        self.interactor = interactor
        self.view = view
        self.delegate = delegate
        self.movie = movie
    }
}

// MARK: - Interactor to Presenter Protocol
extension MovieDetailsPresenter: MovieDetailsInteractorToPresenterProtocol {
    func fetchMovieDetailsSuccess(model: MovieDetailsModel) {
        movieDetails = model
        view.showExternalInfo()
    }

    func fetchMovieDetailsFailure(error: Error?) {
        view?.showAlert(message: error?.localizedDescription ?? "", completionHandler: nil)
    }
}

// MARK: - View to Presenter Protocol
extension MovieDetailsPresenter: MovieDetailsViewToPresenterProtocol {
    func viewDidFinishLoading() {
        view?.showPreloadedInfo()
        interactor?.fetchMovieDetails(id: movie.id)
    }
}
