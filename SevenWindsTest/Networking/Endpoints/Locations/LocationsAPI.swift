//
//  LocationsAPI.swift
//  SevenWindsTest
//
//  Created by Игорь on 13.03.2022.
//

import Foundation

extension NetworkManager {
    struct LocationsAPI {
        private static let router = NetworkRouter<LocationsEndpoint>()

        static func getCoffeehouses(_ completion: @escaping (Result<[Coffeehouse], DecoderError>) -> Void) {
            router.request(.locations) { data, response, error in
                let result = decode(data: data, response: response, error: error, type: [Coffeehouse].self)
                completion(result)
            }
        }

        static func getProducts(by id: String, completion: @escaping (Result<[Product], DecoderError>) -> Void) {
            router.request(.menu(id: id)) { data, response, error in
                let result = decode(data: data, response: response, error: error, type: [Product].self)
                completion(result)
            }
        }
    }
}
