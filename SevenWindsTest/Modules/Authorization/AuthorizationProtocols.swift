//
//  AuthorizationProtocols.swift
//  SevenWindsTest
//
//  Created by Игорь on 17.03.2022.
//

import Foundation

// MARK: - View

protocol AuthorizationViewInput: AnyObject {
    func showError(_ message: String)
}

protocol AuthorizationViewOutput {
    func didLoginButtonTapped(with login: String?, password: String?)
    func didRegisterButtonTapped()
}

// MARK: - Interactor

protocol AuthorizationInteractorInput {
    func login(_ login: String?, password: String?)
}

protocol AuthorizationInteractorOutput: AnyObject {
    func didAuthorizationSuccess()
    func didAuthorizationFailed(withError message: String)
}

// MARK: - Router

protocol AuthorizationRouterInput {
    func showRegistration()
    func showCoffeehouses()
}
