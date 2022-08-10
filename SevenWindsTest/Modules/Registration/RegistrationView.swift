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
        view.textContentType = .emailAddress
        return view
    }()

    private lazy var passwordTextView: MainTextField = {
        let view = MainTextField()
        view.title = "Пароль"
        view.placeholder = "******"
        view.textContentType = .newPassword
        view.isSecureTextEntry = true
        return view
    }()

    private lazy var confirmPasswordTextView: MainTextField = {
        let view = MainTextField()
        view.title = "Повторите пароль"
        view.placeholder = "******"
        view.textContentType = .newPassword
        view.isSecureTextEntry = true
        return view
    }()

    private lazy var registerButton: MainButton = {
        let view = MainButton(type: .filled)
        view.setTitle("Регистрация", for: .normal)
        view.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
        return view
    }()

    private lazy var loginButton: MainButton = {
        let view = MainButton(type: .outlined)
        view.setTitle("Уже есть аккаунт?", for: .normal)
        view.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        return view
    }()

    private lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubviews(loginTextView, passwordTextView, confirmPasswordTextView)
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.spacing = 25.0
        return view
    }()

    private lazy var buttonStackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubviews(registerButton, loginButton)
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.spacing = 8.0
        return view
    }()

    // MARK: - Properties

    var presenter: RegistrationViewOutput

    // MARK: - Lifecycle

    init(presenter: RegistrationViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup UI

    override func setupView() {
        navigationItem.title = "Регистрация"
        view.backgroundColor = R.color.background()
        view.addSubviews(mainStackView, buttonStackView)
    }

    override func setupConstraints() {
        mainStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(18.0)
            $0.centerY.equalToSuperview()
        }

        buttonStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(18.0)
            $0.top.equalTo(mainStackView.snp.bottom).offset(30.0)
        }

        registerButton.snp.makeConstraints {
            $0.height.equalTo(47.0)
        }

        loginButton.snp.makeConstraints {
            $0.height.equalTo(registerButton)
        }
    }

    // MARK: - Actions

    @objc private func registerButtonAction() {
        presenter.didRegisterButtonTapped(
            login: loginTextView.text,
            password: passwordTextView.text,
            confirmPassword: confirmPasswordTextView.text
        )
    }

    @objc private func loginButtonAction() {
        presenter.didLoginButtonTapped()
    }
}

// MARK: - ViewInput

extension RegistrationViewController: RegistrationViewInput {
    func showError(_ message: String) {
        showErrorMessage(message)
    }
}
