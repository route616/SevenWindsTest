//
//  Coffeehouse.swift
//  SevenWindsTest
//
//  Created by Игорь on 13.03.2022.
//

import Foundation

struct Coffeehouse: Codable {
    let id: Int
    let name: String
    let point: Point

    struct Point: Codable {
        let latitude: Double
        let longitude: Double
    }
}
