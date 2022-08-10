//
//  CoffeehousesInteractor.swift
//  SevenWindsTest
//
//  Created by Игорь on 17.03.2022.
//

import Foundation
import CoreLocation

final class CoffeehousesInteractor {

    // MARK: - Properties

    weak var presenter: CoffeehousesInteractorOutput?
    private var data = [Coffeehouse]()

    // MARK: - Private logic

    private func handle(_ error: DecoderError) {
        var errorMessage: String

        switch error {
        case .connectionRefused:
            errorMessage = "Нет интернет-соединения"
        case .missingData:
            errorMessage = "Поблизости не найдено ни олной кофейни"
        case .badResponse(let code):
            if code == 401 {
                errorMessage = "Пользователь не авторизован"
            } else {
                errorMessage = "Неизвестный ответ сервера: код \(code)"
            }
        case .decodingFailure:
            errorMessage = "Ошибка формата данных"
        case .serverError(let text):
            errorMessage = "Ошибка сервера: \(text)"
        }

        presenter?.present(error: errorMessage)
    }
}

// MARK: - InteractorInput

extension CoffeehousesInteractor: CoffeehousesInteractorInput {
    var dataCount: Int { data.count }

    func fetchData() {
        LocationService.shared.startUpdating()
        NetworkManager.LocationsAPI.getCoffeehouses { [weak self] result in
            LocationService.shared.stopUpdating()
            switch result {
            case .success(let data):
                self?.data = data
                self?.presenter?.present()
            case .failure(let error):
                self?.handle(error)
            }
        }
    }

    func coffeehouseName(for index: Int) -> String {
        return data[index].name
    }

    func coffeehouseDistance(for index: Int) -> Double? {
        let latitude = data[index].point.latitude
        let longitude = data[index].point.longitude

        return LocationService.shared.calculateDistanceTo(
            point: CLLocation(latitude: latitude, longitude: longitude)
        )
    }

    func coffeehouseID(for index: Int) -> String {
        return data[index].id
    }
}
