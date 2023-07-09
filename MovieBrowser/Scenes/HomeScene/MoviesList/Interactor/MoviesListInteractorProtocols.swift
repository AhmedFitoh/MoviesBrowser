//
//  MoviesListInteractorProtocols.swift
//
//  Created by AhmedFitoh on 7/8/23.
//  
//

// VIPER Protocol for communication from Presenter to Interactor
protocol MoviesListPresenterToInteractorProtocol: AnyObject {
    func fetchTrendingMovies(page: Int)
}
