//
//  Counter.swift
//  SevenWindsTest
//
//  Created by Игорь on 20.03.2022.
//

import Foundation
import UIKit
import SnapKit

protocol CounterDelegate {
    func didChanged(count: UInt)
}

class Counter: UIView {

    // MARK: - Data types

    enum Style {
        case forCollection
        case forTable
    }

    // MARK: - Views

    private lazy var minusButton: UIButton = {
        let view = UIButton()
        switch style {
        case .forTable:
            view.setImage(R.image.tableStyleMinus(), for: .normal)
        case .forCollection:
            view.setImage(R.image.collectionStyleMinus(), for: .normal)
        }
        view.addTarget(self, action: #selector(minusButtonAction), for: .touchUpInside)
        return view
    }()

    private lazy var plusButton: UIButton = {
        let view = UIButton()
        switch style {
        case .forTable:
            view.setImage(R.image.tableStylePlus(), for: .normal)
        case .forCollection:
            view.setImage(R.image.collectionStylePlus(), for: .normal)
        }
        view.addTarget(self, action: #selector(plusButtonAction), for: .touchUpInside)
        return view
    }()

    private lazy var countLabel: UILabel = {
        let view = UILabel()
        switch style {
        case .forTable:
            view.font = .systemFont(ofSize: 16.0, weight: .bold)
        case .forCollection:
            view.font = .systemFont(ofSize: 14.0, weight: .regular)
        }
        view.textColor = R.color.mainText()
        return view
    }()

    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubviews(minusButton, countLabel, plusButton)
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.alignment = .fill
        view.spacing = 0.0
        return view
    }()

    // MARK: - Properties

    private var style: Style

    private var count: UInt = 1 {
        didSet {
            countLabel.text = "\(count)"
        }
    }

    var delegate: CounterDelegate?

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        style = .forTable
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        style = .forTable
        super.init(coder: coder)
    }

    convenience init(with style: Style) {
        self.init(frame: .zero)
        self.style = style
    }

    // MARK: Setup UI

    private func setupView() {
        addSubview(stackView)
    }

    private func setupConstraints() {
        let size = CGSize(width: 72.0, height: 24.0)

        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.size.equalTo(size)
        }
    }

    // MARK: - Logic

    @objc func minusButtonAction() {
        if count > 1 {
            count -= 1
        }
        delegate?.didChanged(count: count)
    }

    @objc func plusButtonAction() {
        count += 1
        delegate?.didChanged(count: count)
    }
}
