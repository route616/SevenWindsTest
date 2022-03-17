//
//  RegistrationRouter.swift
//  SevenWindsTest
//
//  Created by Игорь on 07.03.2022.
//

import Foundation
import UIKit

final class RegistrationRouter {

    // MARK: - Assembly

    static func assemble() -> UINavigationController {
        let router = RegistrationRouter()
        let presenter = RegistrationPresenter()
        let interactor = RegistrationInteractor()
        let view = RegistrationViewController()

        let navigationController = UINavigationController(rootViewController: view)

        view.presenter = presenter

        interactor.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor

        return navigationController
    }

    // MARK: - Properties

    weak var navigationController: UINavigationController?
}
