//
//  MovieDetailsModel.swift
//
//  Created by AhmedFitoh on 7/9/23.
//

import Foundation

// MARK: - MovieDetailsModel
struct MovieDetailsModel: Codable {
    let backdropPath: String?
    let budget: Int?
    let genres: [Genre]
    let homepage: String?
    let id: Int
    let imdbID, originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [ProductionCompany]?
    let productionCountries: [ProductionCountry]?
    let releaseDate: String?
    let revenue, runtime: Int?
    let spokenLanguages: [SpokenLanguage]
    let status, tagline, title: String?
    let voteAverage, voteCount: Double?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case budget, genres, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue, runtime
        case spokenLanguages = "spoken_languages"
        case status, tagline, title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
    let name: String

    enum CodingKeys: String, CodingKey {
        case name
    }
}

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
    let name: String

    enum CodingKeys: String, CodingKey {
        case name
    }
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    let englishName: String

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
    }
}
