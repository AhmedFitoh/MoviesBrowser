//
//  MovieDetailsWireframe.swift
//
//  Created by AhmedFitoh on 7/9/23.
//  
//

import UIKit

class MovieDetailsWireframe {
    
    // MARK: - Instance Variables
    weak var viewController: UIViewController!

    // MARK:- Life cycle
    init(movie: MovieModel,
         delegate: MovieDetailsDelegate? = nil) {
        let storyboard = UIStoryboard(
            name: MovieDetailsConstants.storyboardIdentifier,
            bundle: Bundle(for: MovieDetailsWireframe.self)
        )
        let view = (storyboard.instantiateViewController(
            withIdentifier: MovieDetailsConstants.viewControllerIdentifier
        ) as? MovieDetailsView)!

        viewController = view
        let interactor = MovieDetailsInteractor()
        let presenter = MovieDetailsPresenter(movie: movie, wireframe: self, view: view, interactor: interactor, delegate: delegate)

        view.presenter = presenter
        interactor.presenter = presenter
    }
}

// MARK: - Presenter to Wireframe Protocol
extension MovieDetailsWireframe: MovieDetailsPresenterToWireframeProtocol {
}
