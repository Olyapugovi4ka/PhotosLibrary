//
//  NetworkService.swift
//  PhotosLibrary
//
//  Created by Olga Melnik on 18.12.2019.
//  Copyright © 2019 Olga Melnik. All rights reserved.
//

import Foundation

class NetworkService {
    // построение запроса данных по url
    func request(searchTerm: String, completion: @escaping(Data?, Error?) -> Void){
        let parametrs = self.prepareParametrs(searchTerm: searchTerm)
        let url = self.url(params: parametrs)
        var request = URLRequest(url:url)
        request.allHTTPHeaderFields = prepareHeaders()
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
        
    }
    
    private func prepareHeaders() -> [String:String]? {
        var headers = [String:String]()
        headers["Authorization"] = "Client-ID 4e5c9ccfcfb3d98e0474a3acbc629385dab61df9b708ffdce21bf61911f9fecd"
        return headers
    }
    
    private func prepareParametrs(searchTerm:String?) -> [String:String]{
        var parametrs = [String:String]()
        parametrs["query"] = searchTerm
        parametrs["page"] = String(1)
        parametrs["per_page"] = String(30)
        
        return parametrs
    }
    
    private func url(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map {
            URLQueryItem(name:$0, value:  $1)
        }
        return components.url!
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data,error)
            }
            
        }
    }
}
