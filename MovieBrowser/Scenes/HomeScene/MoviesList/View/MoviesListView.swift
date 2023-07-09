//
//  MoviesListView.swift
//
//  Created by AhmedFitoh on 7/8/23.
//  
//

import UIKit

class MoviesListView: UIViewController {
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    // MARK: - VIPER Stack
    var presenter: MoviesListViewToPresenterProtocol!
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidFinishLoading()
    }
    
    private func setupUI(){
        setupMoviesTableView()
    }
    
    private func setupMoviesTableView(){
        moviesTableView.tableFooterView = UIView()
        moviesTableView.register(UINib(nibName: "\(MoviesListCell.self)", bundle: nil),
                                   forCellReuseIdentifier: "\(MoviesListCell.self)")
       
        moviesTableView.register(UINib(nibName: "\(LoadingCell.self)", bundle: nil),
                                   forCellReuseIdentifier: "\(LoadingCell.self)")
        
    }
}


// MARK: - TableView delegates
extension MoviesListView: UITableViewDelegate, UITableViewDataSource{
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return presenter?.moviesList.count ?? 0
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(LoadingCell.self)") as? LoadingCell
            return cell ?? UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(MoviesListCell.self)") as? MoviesListCell
        if let movie = presenter?.moviesList [indexPath.row] {
            cell?.setupCellWith(movie: movie, indexPath: indexPath)
        }
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if presenter?.moviesList.isEmpty == true {
            return
        }
        guard let lastMovieIndex = presenter?.lastMovieIndex else {
            return
        }
        
        if lastMovieIndex == indexPath.row {
            presenter?.requestNewPage()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            return
        }
        presenter?.userDidSelectMovieAt(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        } else {
            return presenter?.requestOnProgress == true ? UITableView.automaticDimension : 0
        }
    }
}

// MARK: - Presenter to View Protocol
extension MoviesListView: MoviesListPresenterToViewProtocol {
    func addCellsAt(rows: ClosedRange<Int>) {
        let indexPaths = rows.map {IndexPath(row: $0, section: 0)}
        moviesTableView.insertRows(at: indexPaths, with: .bottom)
    }
    
    func updateLoadingView(){
        if view.window == nil {
            return
        }
        moviesTableView.reloadSections(IndexSet(integer: 1), with: .bottom)
    }
}
