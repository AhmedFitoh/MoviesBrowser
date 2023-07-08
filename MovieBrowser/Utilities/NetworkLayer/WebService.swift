//
//  WebService.swift
//  MovieBrowser
//
//  Created by AhmedFitoh on 7/8/23.
//

import Foundation

protocol NetworkingProtocol: AnyObject {
    func request(_ api: EndPoints,
                 completion: @escaping (Data?)-> Void,
                 failure: @escaping (Error?)-> Void)

    func downloadImage(from url: URL,
                       completion: @escaping (Data?) -> ())
}

final class WebService: NetworkingProtocol {

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

    func downloadImage(from url: URL,
                       completion: @escaping (Data?) -> ())  {
        let ephemeralSession = URLSession(configuration: .ephemeral)
        ephemeralSession.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(nil)
                return }
            completion(data)
            return
        }.resume()
    }
}
