//
//  BaseViewController.swift
//  SevenWindsTest
//
//  Created by Игорь on 14.03.2022.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - Lifecycle abstraction

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar()
        view.setNeedsUpdateConstraints()
    }

    override func updateViewConstraints() {
        setupConstraints()
        super.updateViewConstraints()
    }

    // MARK: - Abstract methods

    func setupView() {}
    func setupConstraints() {}

    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = R.color.navigationBackground()
        appearance.titleTextAttributes = [.foregroundColor: R.color.mainText() ?? .black]
        appearance.largeTitleTextAttributes = [.foregroundColor: R.color.mainText() ?? .black]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }

    // MARK: - Alert mechanic

    func showErrorMessage(_ message: String) {
        let alertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
