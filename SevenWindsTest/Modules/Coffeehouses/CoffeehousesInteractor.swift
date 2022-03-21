//
//  CoffeehousesInteractor.swift
//  SevenWindsTest
//
//  Created by Игорь on 17.03.2022.
//

import Foundation

final class CoffeehousesInteractor {

    // MARK: - Properties

    weak var presenter: CoffeehousesInteractorOutput?

    // MARK: - Private logic

    private func handle(_ error: DecoderError) {
        var errorMessage: String

        switch error {
        case .connectionRefused:
            errorMessage = "Нет интернет-соединения"
        case .missingData:
            errorMessage = "Поблизости не найдено ни олной кофейни"
        case .badResponse(let code):
            errorMessage = "Неизвестный ответ сервера: код \(code)"
        case .decodingFailure:
            errorMessage = "Ошибка формата данных"
        case .serverError(let text):
            errorMessage = "Ошибка сервера: \(text)"
        }

        presenter?.didFetchFailed(withError: errorMessage)
    }
}

// MARK: - InteractorInput

extension CoffeehousesInteractor: CoffeehousesInteractorInput {
    func fetchData() {
        NetworkManager.LocationsAPI.getCoffeehouses { [weak self] result in
            switch result {
            case .success(let data):
                self?.presenter?.didFetchSuccess(data: data)
            case .failure(let error):
                self?.handle(error)
            }
        }
    }
}
