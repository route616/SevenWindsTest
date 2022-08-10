//
//  CoffeehousesRouter.swift
//  SevenWindsTest
//
//  Created by Игорь on 17.03.2022.
//

import Foundation
import UIKit

final class CoffeehousesRouter {

    static func assemble() -> UINavigationController {
        let interactor = CoffeehousesInteractor()
        let router = CoffeehousesRouter()
        let presenter = CoffeehousesPresenter(interactor: interactor, router: router)
        let view = CoffeehousesViewController(presenter: presenter, dataPresenter: presenter)
        let navigationController = UINavigationController(rootViewController: view)

        interactor.presenter = presenter
        presenter.view = view
        router.navigationController = navigationController

        return navigationController
    }

    // MARK: - Properties

    weak var navigationController: UINavigationController?
}

// MARK: - RouterInput

extension CoffeehousesRouter: CoffeehousesRouterInput {
    func showMap() {

    }

    func showMenu(id: String) {
        navigationController?.pushViewController(MenuRouter.assemble(with: id), animated: true)
    }
}
