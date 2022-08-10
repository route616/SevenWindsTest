//
//  Config.swift
//  SevenWindsTest
//
//  Created by Игорь on 03.03.2022.
//

import Foundation

struct Config {
    private init() {}

    struct UserDefaultsKeys {
        static let registered = "isUserRegisteredOnce"
    }

    struct Networking {
        static let baseURL = "http://127.0.0.1:8080/"
    }
    
    struct MapKit {
        static let apiKey = "689d5419-2bf2-4d83-a849-dc5fd1d5b2bb"
    }
}
