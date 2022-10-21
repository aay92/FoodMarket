//
//  NetworkService.swift
//  FoodMarket
//
//  Created by Aleksey Alyonin on 19.10.2022.
//

import Foundation

struct NetworkService {

    
    /// Эта функция помогает сгенерировать запрос
    /// - Parameters:
    ///   - route: Путь к ресурсу в бэкенге
    ///   - method: Метод это тип отправляемого запрова в парметре
    ///   - parameters: любую доп. информацию передеют на серверную часть
    /// - Returns: URLRequest
    func createRequest(route: Route,
                               method: Method,
                               parameters: [String : Any]? = nil )-> URLRequest? {
        let urlString = Route.baseURL + route.description
        guard let url = urlString.asUrl else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue

        if let params = parameters {
            switch method {
            case .gat:
                var urlComponents = URLComponents(string: urlString)
                urlComponents?.queryItems = params.map{ URLQueryItem(name: $0, value: "\($1)")}
                urlRequest.url = urlComponents?.url
            case .post, .delete, .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
}

