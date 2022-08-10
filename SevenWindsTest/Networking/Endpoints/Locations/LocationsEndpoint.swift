//
//  LocationsEndpoint.swift
//  SevenWindsTest
//
//  Created by Игорь on 13.03.2022.
//

import Foundation

enum LocationsEndpoint {
    case locations
    case menu(id: String)
}

extension LocationsEndpoint: Endpoint {
    var path: String {
        switch self {
        case .locations:
            return "locations"
        case .menu(let id):
            return "location/\(id)/menu"
        }
    }

    var method: HTTPMethod { .get }

    var task: HTTPTask {
        .requestWithParametersAndHeaders(nil, bodyParameters: nil, headers: headers)
    }

    var headers: HTTPHeaders? {
        guard let token = CurrentUserService.shared.token else { return [:] }
        print(token)
        return ["Authorization": "Bearer \(token.token)"]
    }
}
