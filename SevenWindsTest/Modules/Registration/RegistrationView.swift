//
//  RegistrationView.swift
//  SevenWindsTest
//
//  Created by Игорь on 07.03.2022.
//

import Foundation
import UIKit
import SnapKit

final class RegistrationViewController: BaseViewController {

    // MARK: - Views

    private lazy var loginTextView: MainTextField = {
        let view = MainTextField()
        view.title = "e-mail"
        view.placeholder = "example@example.com"
        return view
    }()

    private lazy var passwordTextView: MainTextField = {
        let view = MainTextField()
        view.title = "Пароль"
        view.placeholder = "******"
        view.isSecureTextEntry = true
        return view
    }()

    private lazy var confirmPasswordTextView: MainTextField = {
        let view = MainTextField()
        view.title = "Повторите пароль"
        view.placeholder = "******"
        view.isSecureTextEntry = true
        return view
    }()

    private lazy var registerButton: MainButton = {
        let view = MainButton()
        view.setTitle("Регистрация", for: .normal)
        view.addTarget(self, action: #selector(didRegisterButtonTapped), for: .touchUpInside)
        return view
    }()

    private lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubviews(loginTextView, passwordTextView, confirmPasswordTextView, registerButton)
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.spacing = 25.0
        return view
    }()

    // MARK: - Properties

    // MARK: - Setup UI

    override func setupView() {
        view.backgroundColor = R.color.background()
        view.addSubview(mainStackView)
    }

    override func setupConstraints() {
        mainStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(18.0)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(344.0)
        }
        registerButton.snp.makeConstraints {
            $0.height.equalTo(47.0)
        }
    }

    // MARK: - Actions

    @objc private func didRegisterButtonTapped() {

    }
}
