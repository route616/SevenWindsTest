//
//  MenuProtocols.swift
//  SevenWindsTest
//
//  Created by Игорь on 20.03.2022.
//

import Foundation

// MARK: - View

protocol MenuViewInput: AnyObject {
    func update()
    func showError(_ message: String)
}

protocol MenuViewOutput: AnyObject {
    func viewDidAppear()
    func didOrderButtonTapped()
    func didSelect(_ item: MenuCollectionViewCellInput, at indexPath: IndexPath)
}

// MARK: - Interactor

protocol MenuInteractorInput: AnyObject {
    var dataCount: Int { get }
    func fetchData()
    func loadImage(for indexPath: IndexPath, with completion: @escaping (Data?) -> Void)
    func productName(for indexPath: IndexPath) -> String
    func productPrice(for indexPath: IndexPath) -> Int
}

protocol MenuInteractorOutput: AnyObject {
    func didFetchSuccess()
    func didFetchFailed(withError message: String)
}

// MARK: - Router

protocol MenuRouterInput: AnyObject {
    
}

// MARK: - DataPresenter

protocol MenuCellDataPresenter: AnyObject {
    var count: Int { get }
    func configure(_ cell: MenuCollectionViewCellInput, for indexPath: IndexPath)
}
