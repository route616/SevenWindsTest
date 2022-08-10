//
//  CheckpointView.swift
//  SevenWindsTest
//
//  Created by Игорь on 24.04.2022.
//

import Foundation
import UIKit

final class CheckpointView: UIView {

    // MARK: - Subviews

    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = R.image.checkpoint()
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = .boldSystemFont(ofSize: 14.0)
        view.textColor = R.color.mainText()
        return view
    }()

    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubviews(imageView, titleLabel)
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.spacing = 6.0
        return view
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("CheckpointView.init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(stackView)
    }

    private func setupConstraints() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        imageView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 90.0, height: 58.0))
        }
    }
}

// MARK: - ViewInput

extension CheckpointView: CheckpointViewInput {
    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
}
