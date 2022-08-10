//
//  AuthorizationInteractor.swift
//  SevenWindsTest
//
//  Created by Игорь on 07.03.2022.
//

import Foundation

final class AuthorizationInteractor {

    // MARK: - Properties

    weak var presenter: AuthorizationInteractorOutput?

    // MARK: - Private logic

    private func handle(error: DecoderError) {
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
            case 404:
                errorMessage = "Пользователь не существует"
            default:
                errorMessage = "Неизвестный ответ сервера: код \(code)"
            }
        case .decodingFailure:
            errorMessage = "Ошибка формата данных"
        case .serverError(let text):
            errorMessage = "Ошибка сервера: \(text)"
        }

        presenter?.didAuthorizationFailed(withError: errorMessage)
    }
}

// MARK: - InteractorInput

extension AuthorizationInteractor: AuthorizationInteractorInput {
    func login(_ login: String?, password: String?) {
        guard let login = login, let password = password else {
            presenter?.didAuthorizationFailed(withError: "Заполните обязательные поля")
            return
        }

        NetworkManager.AuthorizationAPI.login(login, password: password) { [weak self] result in
            switch result {
            case .success(let token):
                CurrentUserService.shared.token = token
                self?.presenter?.didAuthorizationSuccess()
            case .failure(let error):
                self?.handle(error: error)
            }
        }
    }
}
