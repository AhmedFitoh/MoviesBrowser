//
//  MovieDetailsInteractorProtocols.swift
//
//  Created by AhmedFitoh on 7/27/21.
//  
//

// VIPER Protocol for communication from Presenter to Interactor
protocol MovieDetailsPresenterToInteractorProtocol: AnyObject {
    func fetchMovieDetails(id: Int)
}
