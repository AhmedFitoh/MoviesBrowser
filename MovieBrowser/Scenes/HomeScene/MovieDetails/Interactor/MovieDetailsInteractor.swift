//
//  MovieDetailsInteractor.swift
//
//  Created by AhmedFitoh on 7/27/21.
//  
//

import Foundation

final class MovieDetailsInteractor {
    
    // MARK: - VIPER Stack
    weak var presenter: MovieDetailsInteractorToPresenterProtocol!
    var webService: WebService
    init(webService: WebService = WebService()) {
        self.webService = webService
    }
}

// MARK: - Presenter To Interactor Protocol
extension MovieDetailsInteractor: MovieDetailsPresenterToInteractorProtocol {

    func fetchMovieDetails(id: Int){
        webService.request(.getMovieDetails(id: id)) { [weak self] data in
            guard let data = data else {
                self?.presenter?.fetchMovieDetailsFailure(error: CustomError.generalError)
                return
            }
            if let model = try? JSONDecoder().decode(MovieDetailsModel.self, from: data){
                self?.presenter?.fetchMovieDetailsSuccess(model: model)
            } else {
                self?.presenter?.fetchMovieDetailsFailure(error: CustomError.generalError)
            }
        } failure: { [weak self] error in
            self?.presenter?.fetchMovieDetailsFailure(error: error)
        }
    }
    
}
