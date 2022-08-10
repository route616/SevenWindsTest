//
//  AuthorizationRouter.swift
//  SevenWindsTest
//
//  Created by Игорь on 07.03.2022.
//

import Foundation
import UIKit

final class AuthorizationRouter {

    static func assemble() -> UIViewController {
        let interactor = AuthorizationInteractor()
        let router = AuthorizationRouter()
        let presenter = AuthorizationPresenter(interactor: interactor, router: router)
        let view = AuthorizationViewController(presenter: presenter)

        presenter.view = view
        interactor.presenter = presenter
        router.view = view

        return view
    }

    // MARK: - Properties

    weak var view: UIViewController?
}

// MARK: - RouterInput

extension AuthorizationRouter: AuthorizationRouterInput {
    func showRegistration() {
        let registrationView = RegistrationRouter.assemble()
        registrationView.modalPresentationStyle = .fullScreen
        registrationView.modalTransitionStyle = .flipHorizontal
        view?.present(registrationView, animated: true)
    }

    func showCoffeehouses() {
        let coffeehousesView = CoffeehousesRouter.assemble()
        coffeehousesView.modalPresentationStyle = .fullScreen
        coffeehousesView.modalTransitionStyle = .flipHorizontal
        view?.present(coffeehousesView, animated: true)
    }
}
