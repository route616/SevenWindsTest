//
//  MenuCollectionViewCell.swift
//  SevenWindsTest
//
//  Created by Игорь on 23.03.2022.
//

import Foundation
import UIKit

final class MenuCollectionViewCell: UICollectionViewCell {

    // MARK: - Views

    private lazy var roundedView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.background()
        view.layer.cornerRadius = 5.0
        view.clipsToBounds = true
        return view
    }()

    private lazy var shadowRoundedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 5.0
        view.addShadow(offset: CGSize(width: 0.0, height: 2.0), radius: 2.0, opacity: 0.25)
        view.layer.shouldRasterize = true
        return view
    }()

    private lazy var productImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()

    private lazy var productNameLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 15.0, weight: .medium)
        view.textColor = R.color.thirdText()
        return view
    }()

    private lazy var productPriceLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14.0, weight: .bold)
        view.textColor = R.color.mainText()
        return view
    }()

    private lazy var counter: Counter = {
        let view = Counter(with: .forCollection)
        view.delegate = self
        return view
    }()

    // MARK: - Properties

    static let identifier = "MenuCollectionCellID"
    static let ratio = 205.0 / 165.0

    private var countHandler: ((UInt) -> Void)?

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupConstraints()
    }

    private func setupView() {
        contentView.addSubviews(shadowRoundedView, roundedView)
        roundedView.addSubviews(productImageView, productNameLabel, productPriceLabel, counter)
    }

    private func setupConstraints() {
        roundedView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(7.0)
        }

        shadowRoundedView.snp.makeConstraints {
            $0.edges.equalTo(roundedView)
        }

        productImageView.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
        }

        productNameLabel.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(10.0)
            $0.leading.trailing.equalToSuperview().inset(11.0)
            $0.height.equalTo(18.0)
        }

        counter.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(5.0)
            $0.bottom.equalToSuperview().inset(7.0)
        }

        productPriceLabel.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview().inset(11.0)
            $0.top.equalTo(productNameLabel.snp.bottom).offset(12.0)
            $0.trailing.equalTo(counter.snp.leading).offset(-3.0)
        }
    }
}

// MARK: - ViewInput

extension MenuCollectionViewCell: MenuCollectionViewCellInput {
    var title: String? {
        get { productNameLabel.text }
        set { productNameLabel.text = newValue }
    }

    var subtitle: String? {
        get { productPriceLabel.text }
        set { productPriceLabel.text = newValue }
    }

    var isCountable: Bool {
        get { !counter.isHidden }
        set {
            counter.isHidden = !newValue
            layoutIfNeeded()
        }
    }

    var handler: ((UInt) -> Void)? {
        get { countHandler }
        set { countHandler = newValue }
    }

    func setImage(from data: Data) {
        productImageView.image = UIImage(data: data)
    }

    func setPlaceholderImage() {
        // TODO: Impl placeholder
    }

    func startAnimating() {
        productImageView.startAnimating()
    }

    func stopAnimating() {
        productImageView.stopAnimating()
    }
}

// MARK: - CounterDelegate

extension MenuCollectionViewCell: CounterDelegate {
    func didChanged(count: UInt) {
        countHandler?(count)
    }
}
