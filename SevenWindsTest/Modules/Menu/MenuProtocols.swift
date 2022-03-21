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
    func didSelectItem(at indexPath: IndexPath)
}

// MARK: - Interactor

protocol MenuInteractorInput: AnyObject {

}

protocol MenuInteractorOutput: AnyObject {

}

// MARK: - Router

protocol MenuRouterInput: AnyObject {
    
}

// MARK: - DataPresenter

protocol MenuCellDataPresenter: AnyObject {
    var count: Int { get }
}
