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

protocol CoffeehousesViewOutput: AnyObject {
    func viewDidAppear()
    func didOnMapButtonTapped()
    func didSelectRow(of indexPath: IndexPath)
}

// MARK: - Interactor

protocol CoffeehousesInteractorInput: AnyObject {
    func fetchData()
}

protocol CoffeehousesInteractorOutput: AnyObject {
    func didFetchSuccess(data: [Coffeehouse])
    func didFetchFailed(withError message: String)
}

// MARK: - Router

protocol CoffeehousesRouterInput: AnyObject {
    
}

// MARK: - DataPresenter

protocol CoffeehouseCellDataPresenter: AnyObject {
    var count: Int { get }
    func configure(_ cell: MainTableViewCellInput, for indexPath: IndexPath)
}
