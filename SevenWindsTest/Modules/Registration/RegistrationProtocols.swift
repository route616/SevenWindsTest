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

protocol RegistrationViewOutput: AnyObject {
    func didRegisterButtonTapped(with login: String?, password: String?, confirmPassword: String?)
    func didLoginButtonTapped()
}

// MARK: - Interactor

protocol RegistrationInteractorInput: AnyObject {
    func registerNewUser(_ login: String?, password: String?, confirmPassword: String?)
}

protocol RegistrationInteractorOutput: AnyObject {
    func didRegistrationSuccess()
    func didRegistrationFailed(withError message: String)
}

// MARK: - Router

protocol RegistrationRouterInput: AnyObject {

}
