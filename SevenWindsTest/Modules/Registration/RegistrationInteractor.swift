//
//  RegistrationInteractor.swift
//  SevenWindsTest
//
//  Created by Игорь on 07.03.2022.
//

import Foundation

final class RegistrationInteractor {

    // MARK: - Properties

    weak var presenter: RegistrationInteractorOutput?

    // MARK: - Private logic
    
    private func isSamePasswords(_ password: String, _ confirmPassword: String) -> Bool { password == confirmPassword }

    private func generateErrorMessage(error: DecoderError) {
        var errorMessage: String

        switch error {
        case .connectionRefused:
            errorMessage = "Нет интернет-соединения"
        case .missingData:
            errorMessage = "Ошибка получения данных"
        case .badResponse(let code):
            switch code {
            case 400:
                errorMessage = "Ошибка в запросе"
            case 406:
                errorMessage = "Такой логин уже используется"
            default:
                errorMessage = "Неизвестный ответ сервера: код \(code)"
            }
        case .decodingFailure:
            errorMessage = "Ошибка формата данных"
        case .serverError(let text):
            errorMessage = "Ошибка сервера: \(text)"
        }

        presenter?.didRegistrationFailed(withError: errorMessage)
    }
}

// MARK: - InteractorInput

extension RegistrationInteractor: RegistrationInteractorInput {
    func registerNewUser(_ login: String?, password: String?, confirmPassword: String?) {
        guard
            let login = login,
            let password = password,
            let confirmPassword = confirmPassword
        else {
            presenter?.didRegistrationFailed(withError: "Заполните обязательные поля")
            return
        }

        guard isSamePasswords(password, confirmPassword) else {
            presenter?.didRegistrationFailed(withError: "Пароли не совпадают")
            return
        }

        NetworkManager.AuthorizationAPI.register(login: login, password: password) { [weak self] result in
            switch result {
            case .success(let token):
                CurrentUserService.shared.token = token
                self?.presenter?.didRegistrationSuccess()
            case .failure(let error):
                self?.generateErrorMessage(error: error)
            }
        }
    }
}
