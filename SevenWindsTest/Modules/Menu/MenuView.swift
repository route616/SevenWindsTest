//
//  MenuView.swift
//  SevenWindsTest
//
//  Created by Игорь on 20.03.2022.
//

import Foundation
import UIKit

final class MenuViewController: BaseViewController {

    // MARK: - Views

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        view.contentInset = UIEdgeInsets(top: 10.0, left: 9.0, bottom: 10.0, right: 9.0)
        return view
    }()

    private lazy var orderButton: MainButton = {
        let view = MainButton(type: .filled)
        view.setTitle("Перейти к оплате", for: .normal)
        view.addTarget(self, action: #selector(orderButtonAction), for: .touchUpInside)
        return view
    }()

    // MARK: - Properties

    private var presenter: MenuViewOutput
    private var dataPresenter: MenuCellDataPresenter

    // MARK: - Lifecycle

    init(presenter: MenuViewOutput, dataPresenter: MenuCellDataPresenter) {
        self.presenter = presenter
        self.dataPresenter = dataPresenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }

    override func setupView() {
        navigationItem.title = "Меню"
        view.addSubviews(collectionView, orderButton)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func setupConstraints() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: - Actions

    @objc private func orderButtonAction() {
        presenter.didOrderButtonTapped()
    }
}

// MARK: - MenuViewInput

extension MenuViewController: MenuViewInput {
    func update() {
        collectionView.reloadData()
    }

    func showError(_ message: String) {
        showErrorMessage(message)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return .zero
        }

        let totalSpace = flowLayout.sectionInset.left +
                         flowLayout.sectionInset.right +
                         flowLayout.minimumInteritemSpacing
        let width = (collectionView.bounds.width - totalSpace) / 2.0 - 10.0
        return CGSize(width: width, height: width * MenuCollectionViewCell.ratio)
    }
}

// MARK: - UICollectionViewDelegate

extension MenuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MenuCollectionViewCell else {
            return
        }

        presenter.didSelect(cell, at: indexPath)
    }


}

// MARK: - UICollectionViewDataSource

extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataPresenter.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MenuCollectionViewCell.identifier,
            for: indexPath
        ) as? MenuCollectionViewCell else {
            return UICollectionViewCell()
        }

        dataPresenter.configure(cell, for: indexPath)

        return cell
    }
}
