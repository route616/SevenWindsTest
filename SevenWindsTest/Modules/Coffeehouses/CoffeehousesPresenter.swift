//
//  CoffeehousesPresenter.swift
//  SevenWindsTest
//
//  Created by Игорь on 17.03.2022.
//

import Foundation

final class CoffeehousesPresenter {

    // MARK: - Properties

    weak var view: CoffeehousesViewInput?
    var interactor: CoffeehousesInteractorInput?
    var router: CoffeehousesRouterInput?

    private var data = [Coffeehouse]()
}

// MARK: - ViewOutput

extension CoffeehousesPresenter: CoffeehousesViewOutput {
    func viewDidAppear() {
        interactor?.fetchData()
    }

    func didOnMapButtonTapped() {

        // TODO: - router impl
    }

    func didSelectRow(of indexPath: IndexPath) {

        // TODO: - router impl
    }
}

// MARK: - InteractorOutput

extension CoffeehousesPresenter: CoffeehousesInteractorOutput {
    func didFetchSuccess(data: [Coffeehouse]) {
        self.data = data
        view?.update()
    }

    func didFetchFailed(withError message: String) {
        view?.showError(message)
    }
}

// MARK: - CellDataPresenter

extension CoffeehousesPresenter: CoffeehouseCellDataPresenter {
    var count: Int { data.count }

    func configure(_ cell: MainTableViewCellInput, for indexPath: IndexPath) {
        var distance = LocationService.shared.calculateDistanceTo(point: data[indexPath.row].point)
        var measureUnit = LocationService.MeasureUnit.meters

        if distance > 1000.0 {
            measureUnit = .kilometers
            distance = distance / 1000.0
        }
        distance = (distance * 10).rounded() / 10

        cell.title = data[indexPath.row].name
        cell.subtitle = "\(distance) \(measureUnit.rawValue) от вас"
        cell.isCountable = false
        cell.handler = nil
    }
}
