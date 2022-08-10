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
    var interactor: CoffeehousesInteractorInput
    var router: CoffeehousesRouterInput

    // MARK: - Lifecycle

    init(interactor: CoffeehousesInteractorInput, router: CoffeehousesRouterInput) {
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - ViewOutput

extension CoffeehousesPresenter: CoffeehousesViewOutput {
    func viewDidAppear() {
        interactor.fetchData()
    }

    func didOnMapButtonTapped() {
//        router.showMap()
    }

    func didSelectRow(of index: Int) {
        router.showMenu(id: interactor.coffeehouseID(for: index))
    }
}

// MARK: - InteractorOutput

extension CoffeehousesPresenter: CoffeehousesInteractorOutput {
    func present() {
        view?.update()
    }

    func present(error: String) {
        view?.showError(error)
    }
}

// MARK: - CellDataPresenter

extension CoffeehousesPresenter: CoffeehouseCellDataPresenter {
    var count: Int { interactor.dataCount }

    func configure(_ cell: MainTableViewCellInput, for index: Int) {
        cell.title = interactor.coffeehouseName(for: index)
        cell.isCountable = false
        cell.handler = nil

        if let distance = interactor.coffeehouseDistance(for: index) {
            if distance > 1000.0 {
                cell.subtitle = "\(round(distance / 100.0) / 10.0) км от вас"
            } else {
                cell.subtitle = "\(round(distance)) м от вас"
            }
        } else {
            cell.subtitle = ""
        }
    }
}
