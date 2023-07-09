//
//  MoviesListModel.swift
//  MoviesApp
//
//  Created by AhmedFitoh on 7/8/23.
//

import Foundation


// MARK: - MoviesListModel
struct MoviesListModel: Codable {
    let page: Int
    let results: [MovieModel]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct MovieModel: Codable {
    let overview: String?
    let originalName: String?
    let originCountry: [String]?
    let backdropPath: String?
    let id: Int
    let name: String?
    let posterPath: String
    let firstAirDate: String?
    let releaseDate, title: String?
    let adult: Bool?
    let originalTitle: String?
    let video: Bool?
    
    var movieName: String? {
        if title?.isEmpty == false {
            return title
        } else if originalName?.isEmpty == false {
            return originalName
        } else {
            return originalTitle
        }
    }

    enum CodingKeys: String, CodingKey {
        case overview
        case originalName = "original_name"
        case originCountry = "origin_country"
        case backdropPath = "backdrop_path"
        case id
        case name
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case releaseDate = "release_date"
        case title, adult
        case originalTitle = "original_title"
        case video
    }
}
