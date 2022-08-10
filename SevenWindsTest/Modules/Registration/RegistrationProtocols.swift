//
//  RegistrationProtocols.swift
//  SevenWindsTest
//
//  Created by Игорь on 17.03.2022.
//

import Foundation

// MARK: - View

protocol RegistrationViewInput: AnyObject {
    func showError(_ message: String)
}

protocol RegistrationViewOutput {
    func didRegisterButtonTapped(login: String?, password: String?, confirmPassword: String?)
    func didLoginButtonTapped()
}

// MARK: - Interactor

protocol RegistrationInteractorInput {
    func registerNewUser(_ login: String?, password: String?, confirmPassword: String?)
}

protocol RegistrationInteractorOutput: AnyObject {
    func didRegistrationSuccess()
    func didRegistrationFailed(withError message: String)
}

// MARK: - Router

protocol RegistrationRouterInput {
    func showCoffehouses()
    func showAuthorization()
}
