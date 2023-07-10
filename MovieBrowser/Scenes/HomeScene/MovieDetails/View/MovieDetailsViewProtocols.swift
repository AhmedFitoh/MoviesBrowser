//
//  MovieDetailsViewProtocols.swift
//
//  Created by AhmedFitoh on 7/9/23.
//  
//

// VIPER Protocol for communication from Presenter -> View
protocol MovieDetailsPresenterToViewProtocol: AnyObject, Alertable{
    func showPreloadedInfo()
    func showExternalInfo()
}
