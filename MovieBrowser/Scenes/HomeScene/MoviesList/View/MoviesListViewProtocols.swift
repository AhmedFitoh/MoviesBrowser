//
//  MoviesListViewProtocols.swift
//
//  Created by AhmedFitoh on 7/8/23.
//  
//

// VIPER Protocol for communication from Presenter -> View
protocol MoviesListPresenterToViewProtocol: AnyObject, Alertable {
    func addCellsAt(rows: ClosedRange<Int>)
    func updateLoadingView()
}
