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
    
    static func assemble() -> UIViewController {
        let interactor = RegistrationInteractor()
        let router = RegistrationRouter()
        let presenter = RegistrationPresenter(interactor: interactor, router: router)
        let view = RegistrationViewController(presenter: presenter)

        presenter.view = view
        interactor.presenter = presenter
        router.view = view

        return view
    }

    // MARK: - Properties

    weak var view: UIViewController?
}

// MARK: - RouterInput

extension RegistrationRouter: RegistrationRouterInput {
    func showCoffehouses() {
        let coffeehousesView = CoffeehousesRouter.assemble()
        coffeehousesView.modalPresentationStyle = .fullScreen
        coffeehousesView.modalTransitionStyle = .flipHorizontal
        view?.present(coffeehousesView, animated: true)
    }

    func showAuthorization() {
        let authorizationView = AuthorizationRouter.assemble()
        authorizationView.modalPresentationStyle = .fullScreen
        authorizationView.modalTransitionStyle = .flipHorizontal
        view?.present(authorizationView, animated: true)
    }
}
