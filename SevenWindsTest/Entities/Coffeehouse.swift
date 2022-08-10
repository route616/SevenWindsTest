//
//  Coffeehouse.swift
//  SevenWindsTest
//
//  Created by Игорь on 13.03.2022.
//

import Foundation

struct Coffeehouse: Codable {
    let id: String
    let name: String
    let point: Coordinate

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case point
    }
}
