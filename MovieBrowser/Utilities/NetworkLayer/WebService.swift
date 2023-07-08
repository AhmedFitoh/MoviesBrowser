//
//  WebService.swift
//  MoviesApp
//
//  Created by AhmedFitoh on 7/8/23.
//

import Foundation


class WebService {
    // TODO:- add support to http body when needed
    func request(_ api: EndPoints,
                 completion: @escaping (Data?)-> Void,
                 failure: @escaping (Error?)-> Void){
        guard let url = URL(string: api.url) else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = api.httpMethod
        urlRequest.setValue("Bearer \(Constants.readAccessToken)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            // Return to the main thread
            DispatchQueue.main.async {
                if let error = error{
                    failure(error)
                } else if let data = data{
                    completion(data)
                }
            }
        }.resume()
    }
}
