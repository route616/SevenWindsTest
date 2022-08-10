//
//  MenuPresenter.swift
//  SevenWindsTest
//
//  Created by Игорь on 23.03.2022.
//

import Foundation

final class MenuPresenter {

    // MARK: - Properties

    private var interactor: MenuInteractorInput
    private var router: MenuRouterInput

    weak var view: MenuViewInput?

    // MARK: - Lifecycle

    init(interactor: MenuInteractorInput, router: MenuRouterInput) {
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - ViewOutput

extension MenuPresenter: MenuViewOutput {
    func viewDidAppear() {
        interactor.fetchData()
    }

    func didOrderButtonTapped() {
        // TODO: - router impl
    }

    func didSelect(_ item: MenuCollectionViewCellInput, at indexPath: IndexPath) {
        // TODO: - impl
    }
}

// MARK: - InteractorOutput

extension MenuPresenter: MenuInteractorOutput {
    func didFetchSuccess() {
        view?.update()
    }

    func didFetchFailed(withError message: String) {
        view?.showError(message)
    }
}

// MARK: - CellDataPresenter

extension MenuPresenter: MenuCellDataPresenter {
    var count: Int { interactor.dataCount }

    func configure(_ cell: MenuCollectionViewCellInput, for indexPath: IndexPath) {
        cell.title = interactor.productName(for: indexPath)
        cell.subtitle = "\(interactor.productPrice(for: indexPath)) руб"

        interactor.loadImage(for: indexPath) { data in
            if let data = data {
                cell.setImage(from: data)
            } else {
                cell.setPlaceholderImage()
            }
        }
    }
}
