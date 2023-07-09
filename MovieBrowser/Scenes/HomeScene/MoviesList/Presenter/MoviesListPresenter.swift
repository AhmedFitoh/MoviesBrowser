//
//  MoviesListPresenter.swift
//
//  Created by AhmedFitoh on 7/8/23.
//  

import Foundation

final class MoviesListPresenter {

    // MARK: - VIPER Stack
    weak var view: MoviesListPresenterToViewProtocol!
    var interactor: MoviesListPresenterToInteractorProtocol!
    var wireframe: MoviesListPresenterToWireframeProtocol!
    
    // MARK: - Instance Variables
    weak var delegate: MoviesListDelegate?
    var moviesList: [MovieModel] = []
    var currentPage = 0
    var requestOnProgress = false
    var totalPages: Int? = nil
    var currentItems: Int? = nil
    var lastMovieIndex = 0

    // MARK: - Life Cycle
    init(wireframe: MoviesListPresenterToWireframeProtocol,
         view: MoviesListPresenterToViewProtocol,
         interactor: MoviesListPresenterToInteractorProtocol,
         delegate: MoviesListDelegate? = nil) {

        self.wireframe = wireframe
        self.interactor = interactor
        self.view = view
        self.delegate = delegate
    }

    private func fetchNewTrendingPage(){
        requestOnProgress = true
        view?.updateLoadingView()
        interactor?.fetchTrendingMovies(page: currentPage + 1)
    }
}

// MARK: - Interactor to Presenter Protocol
extension MoviesListPresenter: MoviesListInteractorToPresenterProtocol {
    func fetchTrendingMoviesSuccess(model: MoviesListModel) {
        currentPage = model.page
        totalPages = model.totalPages
        
        let oldLastIndex = moviesList.isEmpty ? 0 : moviesList.count - 1
        let newLastIndex = model.results.count + oldLastIndex - 1
        lastMovieIndex = newLastIndex
        moviesList.append(contentsOf: model.results)
        view?.addCellsAt(rows: oldLastIndex...newLastIndex)
        
        requestOnProgress = false
        view?.updateLoadingView()
    }

    func fetchTrendingMoviesError(error: Error?) {
        requestOnProgress = false
        view?.updateLoadingView()
        view?.showAlert(message: error?.localizedDescription ?? "",
                        completionHandler: nil)
    }
}

// MARK: - View to Presenter Protocol
extension MoviesListPresenter: MoviesListViewToPresenterProtocol {

    func userDidSelectMovieAt(index: Int) {
        wireframe?.openMovieDetails(movie: moviesList [index])
    }

    func requestNewPage() {
        if requestOnProgress  {
            return
        }

        if let totalPages = totalPages,
           totalPages <= currentPage {
            return
        }
        fetchNewTrendingPage()
    }

    func viewDidFinishLoading() {
        requestNewPage()
    }
    
}
