//
//  WebServiceMock.swift
//  MoviesAppTests
//
//  Created by AhmedFitoh on 7/12/23.
//

import Foundation
@testable import MovieBrowser

class WebServiceMock: WebService{
    
    override func request(_ api: EndPoints,
                          completion: @escaping (Data?) -> Void,
                          failure: @escaping (Error?) -> Void) {
        let bundle = Bundle(for: WebServiceMock.self)
        var fileName = ""
        switch api.url {
        case EndPoints.fetchTrendingMovies(page: 1).url:
            fileName = "movies_stub"
        case EndPoints.getMovieDetails(id: 1).url:
            fileName = "details_stub"
        default:
            break
        }
        if let path = bundle.path(forResource: fileName, ofType: "json") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe){
                completion(data)
            } else {
                failure(CustomError.generalError)
            }
        }
    }
}
