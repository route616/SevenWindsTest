//
//  AuthorizationEndpoint.swift
//  SevenWindsTest
//
//  Created by Игорь on 13.03.2022.
//

import Foundation

enum AuthorizationEndpoint {
    case login(_ login: String, password: String)
    case register(login: String, password: String)
}

extension AuthorizationEndpoint: Endpoint {
    var path: String {
        switch self {
        case .login:
            return "auth/login"
        case .register:
            return "auth/register"
        }
    }

    var method: HTTPMethod { .post }

    var task: HTTPTask {
        switch self {
        case .login(let login, let password):
            return .requestWithParameters(nil, bodyParameters: ["login": login, "password": password])
        case .register(let login, let password):
            return .requestWithParameters(nil, bodyParameters: ["login": login, "password": password])
        }
    }

    var headers: HTTPHeaders? { nil }
}
