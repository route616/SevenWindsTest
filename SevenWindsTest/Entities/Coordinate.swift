//
//  Coordinate.swift
//  SevenWindsTest
//
//  Created by Игорь on 19.03.2022.
//

import Foundation

struct Coordinate: Codable {
    let latitude: Double
    let longitude: Double

    var latitudeSin: Double { sin(latitude * Double.pi / 180.0) }
    var latitudeCos: Double { cos(latitude * Double.pi / 180.0) }
}
