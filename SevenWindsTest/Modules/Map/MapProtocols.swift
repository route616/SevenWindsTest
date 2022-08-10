//
//  MapProtocols.swift
//  SevenWindsTest
//
//  Created by Игорь on 21.04.2022.
//

import Foundation

// MARK: - View

protocol MapViewInput: AnyObject {
    func update()
}

protocol MapViewOutput: AnyObject {
    func viewDidAppear()
}

// MARK: - Interactor

protocol MapInteractorInput: AnyObject {

}

protocol MapInteractorOutput: AnyObject {

}

// MARK: - Router

protocol MapRouterInput: AnyObject {

}

// MARK: - MapCellDataPresenter

protocol MapCellDataPresenter: AnyObject {

}

// MARK: - CheckpointViewInput

protocol CheckpointViewInput: AnyObject {
    var title: String? { get set }
}
