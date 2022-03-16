//
//  AuthorizationAPI.swift
//  SevenWindsTest
//
//  Created by Игорь on 13.03.2022.
//

import Foundation

extension NetworkManager {
    struct AuthorizationAPI {
        private static let router = NetworkRouter<AuthorizationEndpoint>()

        static func login(
            _ login: String,
            password: String,
            completion: @escaping (Result<Token, DecoderError>) -> Void
        ) {
            router.request(.login(login, password: password)) { data, response, error in
                let result = decode(data: data, response: response, error: error, type: Token.self)
                completion(result)
            }
        }

        static func register(
            login: String,
            password: String,
            completion: @escaping (Result<Token, DecoderError>) -> Void
        ) {
            router.request(.register(login: login, password: password)) { data, response, error in
                let result = decode(data: data, response: response, error: error, type: Token.self)
                completion(result)
            }
        }
    }
}
