//
//  MainButton.swift
//  SevenWindsTest
//
//  Created by Игорь on 13.03.2022.
//

import UIKit

final class MainButton: UIButton {
    // MARK: - Lifecycle

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        prepareView()
    }

    init() {
        super.init(frame: .zero)
        prepareView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2.0
    }

    private func prepareView() {
        backgroundColor = R.color.main()
        setTitleColor(R.color.secondaryText(), for: .normal)
        titleLabel?.font = .systemFont(ofSize: 18.0, weight: .semibold)
    }
}
