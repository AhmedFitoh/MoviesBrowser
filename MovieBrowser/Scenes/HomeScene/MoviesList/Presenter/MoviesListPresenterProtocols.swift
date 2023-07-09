//
//  MoviesListPresenterProtocols.swift
//
//  Created by AhmedFitoh on 7/8/23.
//  
//

// VIPER Protocol to the Module
protocol MoviesListDelegate: AnyObject {
    
}

// VIPER Protocol for communication from Interactor -> Presenter
protocol MoviesListInteractorToPresenterProtocol: AnyObject {
    func fetchTrendingMoviesSuccess(model: MoviesListModel)
    func fetchTrendingMoviesError(error: Error?)
}

// VIPER Protocol for communication from View -> Presenter
protocol MoviesListViewToPresenterProtocol: AnyObject {
    var moviesList: [MovieModel] {get}
    var requestOnProgress: Bool {get}
    var lastMovieIndex: Int {get}
    func viewDidFinishLoading()
    func requestNewPage()
    func userDidSelectMovieAt(index: Int)
}
