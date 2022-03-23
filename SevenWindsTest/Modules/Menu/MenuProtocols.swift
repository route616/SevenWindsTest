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
    func fetchData()
    func loadImage(from urlAddress: String, with completion: (Data?) -> Void)
}

protocol MenuInteractorOutput: AnyObject {
    func didFetchSuccess(data: [Product])
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
