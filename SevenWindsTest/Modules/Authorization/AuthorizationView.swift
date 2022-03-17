//
//  AuthorizationView.swift
//  SevenWindsTest
//
//  Created by Игорь on 07.03.2022.
//

import Foundation
import UIKit

final class AuthorizationViewController: BaseViewController {

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

    private lazy var loginButton: MainButton = {
        let view = MainButton()
        view.setTitle("Войти", for: .normal)
        view.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        return view
    }()

    private lazy var loginButtonShadowView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.main()
        view.layer.cornerRadius = 47.0 / 2.0
        view.addShadow(offset: CGSize(width: 0.0, height: 2.0), radius: 4.0, opacity: 0.2)
        return view
    }()

    private lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubviews(loginTextView, passwordTextView)
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.spacing = 25.0
        return view
    }()

    // MARK: - Setup UI

    override func setupView() {
        navigationItem.title = "Вход"
        view.backgroundColor = R.color.background()
        view.addSubview(mainStackView)
        view.addSubview(loginButtonShadowView)
        view.addSubview(loginButton)
    }

    override func setupConstraints() {
        mainStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(18.0)
            $0.centerY.equalToSuperview()
        }
        loginButton.snp.makeConstraints {
            $0.height.equalTo(47.0)
            $0.top.equalTo(mainStackView.snp.bottom).offset(30.0)
            $0.leading.trailing.equalToSuperview().inset(18.0)
        }
        loginButtonShadowView.snp.makeConstraints {
            $0.edges.equalTo(loginButton)
        }
    }

    // MARK: - Properties

    var presenter: AuthorizationViewOutput?

    // MARK: - Actions

    @objc private func loginButtonAction() {
        presenter?.didLoginButtonTapped(with: loginTextView.text, password: passwordTextView.text)
    }
}

// MARK: - ViewInput

extension AuthorizationViewController: AuthorizationViewInput {
    func showError(_ message: String) {
        showErrorMessage(message)
    }
}
