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
        view.setNeedsUpdateConstraints()
    }

    override func updateViewConstraints() {
        setupConstraints()
        super.updateViewConstraints()
    }

    func setupView() {}
    func setupConstraints() {}

    // MARK: - Alert mechanic

    func showErrorMessage(_ message: String) {
        let alertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
