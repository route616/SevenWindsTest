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
    
    var token: Token?
}
