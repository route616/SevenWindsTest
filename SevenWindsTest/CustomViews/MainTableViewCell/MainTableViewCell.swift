//
//  MainTableViewCell.swift
//  SevenWindsTest
//
//  Created by Игорь on 18.03.2022.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {

    // MARK: - Data types

    enum CellStyle {
        case `default`
        case withCounter
    }

    // MARK: - Views

    private let roundedView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.secondaryText()
        view.layer.cornerRadius = 5.0
        return view
    }()

    private let roundedShadowView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 5.0
        view.addShadow(offset: CGSize(width: 0.0, height: 2.0), radius: 2.0, opacity: 0.25)
        return view
    }()

    private let mainLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 18.0, weight: .bold)
        view.textColor = R.color.mainText()
        view.textAlignment = .left
        return view
    }()

    private let secondaryLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14.0, weight: .regular)
        view.textColor = R.color.thirdText()
        view.textAlignment = .left
        return view
    }()

    private lazy var counter: Counter = {
        let view = Counter()
        return view
    }()

    // MARK: - Properties

    private var style: MainTableViewCell.CellStyle = .default {
        didSet {
            switch style {
            case .`default`:
                counter.isHidden = true
            case .withCounter:
                counter.isHidden = false
            }
            layoutIfNeeded()
        }
    }

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupConstraints()
    }

    // MARK: - Setup UI

    private func setupView() {
        contentView.addSubviews(roundedShadowView, roundedView)
        roundedView.addSubviews(mainLabel, secondaryLabel, counter)
    }

    private func setupConstraints() {
        roundedView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10.0)
            $0.trailing.equalToSuperview().inset(16.0)
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().inset(6.0)
        }

        roundedShadowView.snp.makeConstraints {
            $0.edges.equalTo(roundedView)
        }

        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14.0)
            $0.leading.trailing.equalToSuperview().inset(10.0)
            $0.height.equalTo(21.0)
        }

        secondaryLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10.0)
            $0.top.equalTo(mainLabel.snp.bottom).offset(6.0)
            $0.bottom.equalToSuperview().inset(9.0)
            $0.height.equalTo(21.0)
        }

        counter.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(10.0)
        }
    }
}

// MARK: - ViewInput

extension MainTableViewCell: MainTableViewCellInput {
    var title: String? {
        get { mainLabel.text }
        set { mainLabel.text = newValue }
    }

    var subtitle: String? {
        get { secondaryLabel.text }
        set { secondaryLabel.text = newValue }
    }

    var isCountable: Bool {
        get { style == .withCounter }
        set {
            if newValue {
                style = .withCounter
            } else {
                style = .default
            }
        }
    }
}
