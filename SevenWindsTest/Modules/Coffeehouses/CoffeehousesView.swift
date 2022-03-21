//
//  CoffeehousesView.swift
//  SevenWindsTest
//
//  Created by Игорь on 17.03.2022.
//

import Foundation
import UIKit

final class CoffeehousesViewController: BaseViewController {

    // MARK: - Views

    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(MainTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        return view
    }()

    private lazy var onMapButton: MainButton = {
        let view = MainButton(type: .filled)
        view.setTitle("На карте", for: .normal)
        view.addTarget(self, action: #selector(onMapButtonAction), for: .touchUpInside)
        return view
    }()

    // MARK: - Properties

    private let cellIdentifier = "CoffeehouseCellID"
    var presenter: CoffeehousesViewOutput?
    var dataPresenter: CoffeehouseCellDataPresenter?

    // MARK: - Setup UI

    override func setupView() {
        navigationItem.title = "Ближайшие кофейни"
        view.addSubviews(tableView, onMapButton)
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        onMapButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(18.0)
            $0.bottom.equalToSuperview().inset(32.0)
            $0.height.equalTo(47.0)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidAppear()
    }

    // MARK: - Actions

    @objc private func onMapButtonAction() {
        presenter?.didOnMapButtonTapped()
    }
}

// MARK: - ViewInput

extension CoffeehousesViewController: CoffeehousesViewInput {
    func update() {
        tableView.reloadData()
    }

    func showError(_ message: String) {
        showErrorMessage(message)
    }
}

// MARK: - UITableViewDelegate

extension CoffeehousesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRow(of: indexPath)
    }
}

// MARK: - UITableViewDataSource

extension CoffeehousesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataPresenter?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier,
            for: indexPath
        ) as? MainTableViewCell else {
            return UITableViewCell()
        }
        dataPresenter?.configure(cell: cell, for: indexPath)
        return cell
    }
}
