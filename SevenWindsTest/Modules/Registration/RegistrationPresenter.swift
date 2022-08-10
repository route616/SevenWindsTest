//
//  RegistrationPresenter.swift
//  SevenWindsTest
//
//  Created by Игорь on 07.03.2022.
//

import Foundation

final class RegistrationPresenter {

    // MARK: - Properties

    private var interactor: RegistrationInteractorInput
    private var router: RegistrationRouterInput
    
    weak var view: RegistrationViewInput?

    // MARK: - Lifecycle

    init(interactor: RegistrationInteractorInput, router: RegistrationRouterInput) {
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - ViewOutput

extension RegistrationPresenter: RegistrationViewOutput {
    func didRegisterButtonTapped(login: String?, password: String?, confirmPassword: String?) {
        interactor.registerNewUser(login, password: password, confirmPassword: confirmPassword)
    }

    func didLoginButtonTapped() {
        router.showAuthorization()
    }
}

// MARK: - InteractorOutput

extension RegistrationPresenter: RegistrationInteractorOutput {
    func didRegistrationSuccess() {
        router.showCoffehouses()
    }

    func didRegistrationFailed(withError message: String) {
        view?.showError(message)
    }
}
