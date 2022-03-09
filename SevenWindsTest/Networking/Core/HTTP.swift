//
//  HTTP.swift
//  SevenWindsTest
//
//  Created by Игорь on 03.03.2022.
//

import Foundation

public typealias NetworkParameters = [String: Any]
public typealias HTTPHeaders = [String: String]

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

public enum HTTPTask {
    case request

    case requestWithParameters(
        _ urlParameters: NetworkParameters?,
        bodyParameters: NetworkParameters?
    )

    case requestWithParametersAndHeaders(
        _ urlParameters: NetworkParameters?,
        bodyParameters: NetworkParameters?,
        headers: HTTPHeaders?
    )
}
