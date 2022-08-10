//
//  LocationService.swift
//  SevenWindsTest
//
//  Created by Игорь on 18.03.2022.
//

import Foundation
import CoreLocation

final class LocationService: NSObject {
    static let shared = LocationService()

    private let locationManager = CLLocationManager()
    private var currentLocation: CLLocation?

    override private init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }

    // MARK: - Methods

    func calculateDistanceTo(point: CLLocation) -> Double? {
        guard let location = self.currentLocation else { return nil }
        return location.distance(from: point)
    }

    func startUpdating() {
        locationManager.startUpdatingLocation()
    }

    func stopUpdating() {
        locationManager.stopUpdatingLocation()
    }
}

// MARK: - CLLocationManagerDelegate

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.currentLocation = location
    }
}
