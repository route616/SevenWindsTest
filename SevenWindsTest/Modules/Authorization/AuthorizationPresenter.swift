//
//  AuthorizationPresenter.swift
//  SevenWindsTest
//
//  Created by Игорь on 07.03.2022.
//

import Foundation

final class AuthorizationPresenter {

    // MARK: - Properties

    weak var view: AuthorizationViewInput?
    var interactor: AuthorizationInteractorInput?
    var router: AuthorizationRouterInput?
}

// MARK: - ViewOutput

extension AuthorizationPresenter: AuthorizationViewOutput {
    func didLoginButtonTapped(with login: String?, password: String?) {
        interactor?.login(login, password: password)
    }

    func didRegisterButtonTapped() {
        
    }
}

// MARK: - InteractorOutput

extension AuthorizationPresenter: AuthorizationInteractorOutput {
    func didAuthorizationSuccess() {

    }

    func didAuthorizationFailed(withError message: String) {
        view?.showError(message)
    }
}
