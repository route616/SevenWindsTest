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
        let navigationBarAppearance = UINavigationBarAppearance()
        let barButtonAppearance = UIBarButtonItemAppearance(style: .plain)

        barButtonAppearance.normal.titleTextAttributes = [.foregroundColor: R.color.mainText() ?? .black]

        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = R.color.navigationBackground()
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: R.color.mainText() ?? .black]
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: R.color.mainText() ?? .black]
        navigationBarAppearance.backButtonAppearance = barButtonAppearance
        navigationBarAppearance.buttonAppearance = barButtonAppearance
        navigationBarAppearance.doneButtonAppearance = barButtonAppearance
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        navigationController?.navigationBar.tintColor = R.color.mainText() ?? .black
    }

    // MARK: - Alert mechanic

    func showErrorMessage(_ message: String) {
        let alertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
