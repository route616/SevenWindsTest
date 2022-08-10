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
    var interactor: AuthorizationInteractorInput
    var router: AuthorizationRouterInput

    // MARK: - Lifecycle

    init(interactor: AuthorizationInteractorInput, router: AuthorizationRouterInput) {
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - ViewOutput

extension AuthorizationPresenter: AuthorizationViewOutput {
    func didLoginButtonTapped(with login: String?, password: String?) {
        interactor.login(login, password: password)
    }

    func didRegisterButtonTapped() {
        router.showRegistration()
    }
}

// MARK: - InteractorOutput

extension AuthorizationPresenter: AuthorizationInteractorOutput {
    func didAuthorizationSuccess() {
        router.showCoffeehouses()
    }

    func didAuthorizationFailed(withError message: String) {
        view?.showError(message)
    }
}
