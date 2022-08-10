//
//  MenuRouter.swift
//  SevenWindsTest
//
//  Created by Игорь on 23.03.2022.
//

import Foundation
import UIKit

final class MenuRouter {

    static func assemble(with id: String) -> UIViewController {
        let interactor = MenuInteractor(withCoffeehouse: id)
        let router = MenuRouter()
        let presenter = MenuPresenter(interactor: interactor, router: router)
        let view = MenuViewController(presenter: presenter, dataPresenter: presenter)

        presenter.view = view
        interactor.presenter = presenter
        router.viewController = view

        return view
    }

    // MARK: - Properties

    weak var viewController: UIViewController?
}

// MARK: - RouterInput

extension MenuRouter: MenuRouterInput {

}
