//
//  CoffeehousesProtocols.swift
//  SevenWindsTest
//
//  Created by Игорь on 17.03.2022.
//

import Foundation

// MARK: - View

protocol CoffeehousesViewInput: AnyObject {
    func update()
    func showError(_ message: String)
}

protocol CoffeehousesViewOutput {
    func viewDidAppear()
    func didOnMapButtonTapped()
    func didSelectRow(of index: Int)
}

// MARK: - Interactor

protocol CoffeehousesInteractorInput {
    var dataCount: Int { get }
    func fetchData()
    func coffeehouseName(for index: Int) -> String
    func coffeehouseDistance(for index: Int) -> Double?
    func coffeehouseID(for index: Int) -> String
}

protocol CoffeehousesInteractorOutput: AnyObject {
    func present()
    func present(error: String)
}

// MARK: - Router

protocol CoffeehousesRouterInput {
    func showMap()
    func showMenu(id: String)
}

// MARK: - DataPresenter

protocol CoffeehouseCellDataPresenter: AnyObject {
    var count: Int { get }
    func configure(_ cell: MainTableViewCellInput, for index: Int)
}
