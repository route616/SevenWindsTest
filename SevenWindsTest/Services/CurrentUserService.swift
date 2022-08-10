//
//  CurrentUserService.swift
//  SevenWindsTest
//
//  Created by Игорь on 03.03.2022.
//

import Foundation

final class CurrentUserService {
    static let shared = CurrentUserService()
    private init() {}
    
    // MARK: - Properties

    var token: Token?

    // MARK: - Methods
    
    func didUserRegisteredOnce() {
        UserDefaults.standard.set(true, forKey: Config.UserDefaultsKeys.registered)
    }

    func isUserRegisteredOnce() -> Bool {
        UserDefaults.standard.bool(forKey: Config.UserDefaultsKeys.registered)
    }
}
