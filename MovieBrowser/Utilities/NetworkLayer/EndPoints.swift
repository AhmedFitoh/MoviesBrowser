//
//  EndPoints.swift
//  MoviesApp
//
//  Created by AhmedFitoh on 7/8/23.
//

import Foundation

struct BaseUrls{
    fileprivate static let defaultURL = "https://api.themoviedb.org/3/"
}


enum EndPoints{
    case fetchTrendingMovies(page: Int)
    case getMovieDetails(id: Int)
}

extension EndPoints{
   fileprivate var path: String{
        switch self {
        case .fetchTrendingMovies(let page):
            return  "trending/all/week?page=\(page)"
        case .getMovieDetails(let id):
            return "movie/\(id)"
        }
    }
    
    var httpMethod: String{
        switch self {
        case .fetchTrendingMovies, .getMovieDetails:
            return "GET"
        }
    }
    
    var url: String{
        switch self {
        case .fetchTrendingMovies, .getMovieDetails:
            return BaseUrls.defaultURL + path
        }
    }
}

