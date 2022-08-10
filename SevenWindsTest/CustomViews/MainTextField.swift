//
//  MainTextField.swift
//  SevenWindsTest
//
//  Created by Игорь on 13.03.2022.
//

import UIKit
import SnapKit

class MainTextField: UIView {

    // MARK: - Subviews

    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = R.color.mainText()
        view.font = .systemFont(ofSize: 15.0, weight: .regular)
        return view
    }()

    private lazy var textField: UITextField = {
        let view = UITextField()
        view.layer.borderColor = R.color.mainText()?.cgColor
        view.layer.borderWidth = 2.0
        view.textColor = R.color.mainText()
        view.font = .systemFont(ofSize: 18.0, weight: .regular)
        view.setLeftPadding(18.0)
        view.setRightPadding(18.0)
        return view
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        addSubviews(textField, titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(18.0)
            $0.bottom.equalTo(textField.snp.top).offset(-8.0)
        }
        textField.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(47.0)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        textField.layer.cornerRadius = textField.frame.height / 2.0
    }

    // MARK: - Proxy

    var text: String? {
        get { textField.text }
        set { textField.text = newValue }
    }

    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }

    var placeholder: String? {
        get { textField.attributedPlaceholder?.string }
        set {
            textField.attributedPlaceholder = NSAttributedString(
                string: newValue ?? "",
                attributes: [.foregroundColor: R.color.thirdText() ?? .systemGray]
            )
        }
    }

    var isSecureTextEntry: Bool {
        get { textField.isSecureTextEntry }
        set { textField.isSecureTextEntry = newValue }
    }

    var textContentType: UITextContentType {
        get { textField.textContentType }
        set { textField.textContentType = newValue }
    }
}
