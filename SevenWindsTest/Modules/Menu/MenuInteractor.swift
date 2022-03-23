//
//  MenuInteractor.swift
//  SevenWindsTest
//
//  Created by Игорь on 23.03.2022.
//

import Foundation

final class MenuInteractor {

    // MARK: - Properties

    weak var presenter: MenuInteractorOutput?
    var coffeehouseID: Int

    init(withCoffeehouse id: Int) {
        self.coffeehouseID = id
    }

    // MARK: - Private logic

    private func handle(_ error: DecoderError) {
        var errorMessage: String
        
        switch error {
        case .connectionRefused:
            errorMessage = "Нет интернет-соединения"
        case .missingData:
            errorMessage = "Нет доступных для заказа товаров"
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

extension MenuInteractor: MenuInteractorInput {
    func fetchData() {
        NetworkManager.LocationsAPI.getProducts(by: coffeehouseID) { [weak self] result in
            switch result {
            case .success(let data):
                self?.presenter?.didFetchSuccess(data: data)
            case .failure(let error):
                self?.handle(error)
            }
        }
    }

    func loadImage(from urlAddress: String, with completion: (Data?) -> Void) {
        WebImageService.downloadImage(from: urlAddress) { data in
            completion(data)
        }
    }
}
