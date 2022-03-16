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
        view.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
        return view
    }()

    private lazy var registerButtonShadowView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.main()
        view.layer.cornerRadius = 47.0 / 2.0
        view.addShadow(offset: CGSize(width: 0.0, height: 2.0), radius: 4.0, opacity: 0.2)
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

    // MARK: - Properties

    var presenter: RegistrationViewOutput?

    // MARK: - Setup UI

    override func setupView() {
        navigationItem.title = "Регистрация"
        view.backgroundColor = R.color.background()
        view.addSubview(mainStackView)
        view.addSubview(registerButtonShadowView)
        view.addSubview(registerButton)
    }

    override func setupConstraints() {
        mainStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(18.0)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(267.0)
        }
        registerButton.snp.makeConstraints {
            $0.height.equalTo(47.0)
            $0.top.equalTo(mainStackView.snp.bottom).offset(30.0)
            $0.leading.trailing.equalToSuperview().inset(18.0)
        }
        registerButtonShadowView.snp.makeConstraints {
            $0.edges.equalTo(registerButton)
        }
    }

    // MARK: - Actions

    @objc private func registerButtonAction() {
        presenter?.didRegisterButtonTapped(
            with: loginTextView.text,
            password: passwordTextView.text,
            confirmPassword: confirmPasswordTextView.text
        )
    }
}

// MARK: - ViewInput

extension RegistrationViewController: RegistrationViewInput {
    func showError(_ message: String) {
        showErrorMessage(message)
    }
}
