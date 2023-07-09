//
//  MoviesListInteractor.swift
//
//  Created by AhmedFitoh on 7/8/23.
//  
//

import Foundation

class MoviesListInteractor {
    
    // MARK: - VIPER Stack
    weak var presenter: MoviesListInteractorToPresenterProtocol!
    var webService: WebService
    init(webService: WebService = WebService()) {
        self.webService = webService
    }

}

// MARK: - Presenter To Interactor Protocol
extension MoviesListInteractor: MoviesListPresenterToInteractorProtocol {
    
    func fetchTrendingMovies(page: Int){
        webService.request(.fetchTrendingMovies(page: page)) { [weak self] data in
            guard let data = data else {
                self?.presenter?.fetchTrendingMoviesError(error: CustomError.generalError)
                return
            }
            
            if let model = try? JSONDecoder().decode(MoviesListModel.self, from: data){
                self?.presenter?.fetchTrendingMoviesSuccess(model: model)
            } else {
                self?.presenter?.fetchTrendingMoviesError(error: CustomError.generalError)
            }
            
        } failure: { [weak self] error in
            self?.presenter?.fetchTrendingMoviesError(error: error)
        }
    }
}
