//
//  LocationService.swift
//  SevenWindsTest
//
//  Created by Игорь on 18.03.2022.
//

import Foundation

final class LocationService {
    static let shared = LocationService()
    private init() {}

    // MARK: - Data types

    enum MeasureUnit: String {
        case meters = "метров"
        case kilometers = "км"
    }

    // MARK: - Math methods

    func calculateDistanceTo(point: Coordinate) -> Double {

    }

    // D = R * arccos(sin(fi1) * sin(fi2) + cos(fi1) * cos(fi2) * cos(lambda2 - lambda1))

    private func calculateDistanceBetween(_ firstPoint: Coordinate, _ secondPoint: Coordinate) -> Double {
        let earthRadius: Double = 6_371_000.0
        let sinFi1 = firstPoint.latitudeSin
        let sinFi2 = secondPoint.latitudeSin
        let cosFi1 = firstPoint.latitudeCos
        let cosFi2 = secondPoint.latitudeCos
        let cosLambdas = cos((firstPoint.longitude - secondPoint.longitude) * Double.pi / 180.0)

        return earthRadius * acos(sinFi1 * sinFi2 + cosFi1 * cosFi2 * cosLambdas)
    }
}
