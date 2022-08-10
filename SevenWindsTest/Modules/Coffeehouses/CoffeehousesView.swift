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
    private var presenter: CoffeehousesViewOutput
    private var dataPresenter: CoffeehouseCellDataPresenter

    // MARK: - Lifecycle

    init(presenter: CoffeehousesViewOutput, dataPresenter: CoffeehouseCellDataPresenter) {
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

    // MARK: - Setup UI

    override func setupView() {
        navigationItem.title = "Ближайшие кофейни"
        view.addSubviews(tableView, onMapButton)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
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

    // MARK: - Actions

    @objc private func onMapButtonAction() {
        presenter.didOnMapButtonTapped()
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
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectRow(of: indexPath.row)
    }
}

// MARK: - UITableViewDataSource

extension CoffeehousesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataPresenter.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier,
            for: indexPath
        ) as? MainTableViewCell else {
            return UITableViewCell()
        }
        dataPresenter.configure(cell, for: indexPath.row)
        return cell
    }
}
