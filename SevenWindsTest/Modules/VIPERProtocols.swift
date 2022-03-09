//
//  VIPERProtocols.swift
//  SevenWindsTest
//
//  Created by Игорь on 07.03.2022.
//

import Foundation

// MARK: - View

protocol Viewable {

}

// MARK: - Interactor

protocol Interactable {

}

// MARK: - Presenter

protocol Presentable {

}

// MARK: - Router

protocol Routable {
    static func start() -> Routable
}
