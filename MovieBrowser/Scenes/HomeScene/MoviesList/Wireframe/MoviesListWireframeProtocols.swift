//
//  MoviesListWireframeProtocols.swift
//
//  Created by AhmedFitoh on 7/8/23.
//  
//

// VIPER Module Constants
struct MoviesListConstants {
    static let navigationControllerIdentifier = "MoviesListNavigationController"
    static let storyboardIdentifier = "MoviesList"
}

// VIPER Protocol for communication from Presenter -> Wireframe
protocol MoviesListPresenterToWireframeProtocol: AnyObject {
    func openMovieDetails(movie: MovieModel)
}
