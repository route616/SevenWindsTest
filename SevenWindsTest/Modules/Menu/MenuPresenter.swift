//
//  MenuPresenter.swift
//  SevenWindsTest
//
//  Created by Игорь on 23.03.2022.
//

import Foundation

final class MenuPresenter {

    // MARK: - Properties

    weak var view: MenuViewInput?
    var interactor: MenuInteractorInput?
    var router: MenuRouterInput?

    private var data = [Product]()
}

// MARK: - ViewOutput

extension MenuPresenter: MenuViewOutput {
    func viewDidAppear() {
        interactor?.fetchData()
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
    func didFetchSuccess(data: [Product]) {
        self.data = data
        view?.update()
    }

    func didFetchFailed(withError message: String) {
        view?.showError(message)
    }
}

// MARK: - CellDataPresenter

extension MenuPresenter: MenuCellDataPresenter {
    var count: Int { data.count }

    func configure(_ cell: MenuCollectionViewCellInput, for indexPath: IndexPath) {
        let item = data[indexPath.row]

        cell.title = item.name
        cell.subtitle = "\(item.price) руб"

        interactor?.loadImage(from: item.imageURL) { data in
            if let data = data {
                cell.setImage(from: data)
            } else {
                cell.setPlaceholderImage()
            }
        }
    }
}
