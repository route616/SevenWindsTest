//
//  Endpoint.swift
//  SevenWindsTest
//
//  Created by Игорь on 03.03.2022.
//

import Foundation

protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

extension Endpoint {
    var baseURL: URL {
        guard let url = URL(string: Config.Networking.baseURL) else {
            fatalError("Missing base URL.")
        }
        return url
    }
}
