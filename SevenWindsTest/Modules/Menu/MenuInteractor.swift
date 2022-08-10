//
//  MenuInteractor.swift
//  SevenWindsTest
//
//  Created by Игорь on 23.03.2022.
//

import Foundation

final class MenuInteractor {

    // MARK: - Properties

    private var data = [Product]()

    weak var presenter: MenuInteractorOutput?
    private let coffeehouseID: String

    init(withCoffeehouse id: String) {
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
    var dataCount: Int { data.count }

    func productName(for indexPath: IndexPath) -> String { data[indexPath.item].name }
    func productPrice(for indexPath: IndexPath) -> Int { data[indexPath.item].price }

    func fetchData() {
        NetworkManager.LocationsAPI.getProducts(by: coffeehouseID) { [weak self] result in
            switch result {
            case .success(let data):
                self?.data = data
                self?.presenter?.didFetchSuccess()
            case .failure(let error):
                self?.handle(error)
            }
        }
    }

    func loadImage(for indexPath: IndexPath, with completion: @escaping (Data?) -> Void) {
        WebImageService.downloadImage(from: data[indexPath.item].imageURL) { data in
            completion(data)
        }
    }
}
