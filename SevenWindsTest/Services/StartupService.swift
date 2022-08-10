//
//  RootRouter.swift
//  SevenWindsTest
//
//  Created by Игорь on 25.03.2022.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift
import YandexMapKit

final class StartupService {

    static func start(in scene: UIScene) -> UIWindow? {
        guard let windowScene = (scene as? UIWindowScene) else { return nil }
        let window = UIWindow(windowScene: windowScene)

        if CurrentUserService.shared.isUserRegisteredOnce() {
            window.rootViewController = AuthorizationRouter.assemble()
        } else {
            window.rootViewController = RegistrationRouter.assemble()
        }

        window.makeKeyAndVisible()
        setupIQKeyboardManager()
        YMKMapKit.setApiKey(Config.MapKit.apiKey)
        
        return window
    }

    private static func setupIQKeyboardManager() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.enableAutoToolbar = false
    }
}
