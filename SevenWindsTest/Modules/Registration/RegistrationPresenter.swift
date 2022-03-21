//
//  RegistrationPresenter.swift
//  SevenWindsTest
//
//  Created by Игорь on 07.03.2022.
//

import Foundation

final class RegistrationPresenter {

    // MARK: - Properties
    weak var view: RegistrationViewInput?
    var interactor: RegistrationInteractorInput?
    var router: RegistrationRouterInput?
}

// MARK: - ViewOutput

extension RegistrationPresenter: RegistrationViewOutput {
    func didRegisterButtonTapped(with login: String?, password: String?, confirmPassword: String?) {
        interactor?.registerNewUser(login, password: password, confirmPassword: confirmPassword)
    }

    func didLoginButtonTapped() {
        
    }
}

// MARK: - InteractorOutput

extension RegistrationPresenter: RegistrationInteractorOutput {
    func didRegistrationSuccess() {
        
    }

    func didRegistrationFailed(withError message: String) {
        view?.showError(message)
    }
}
