//
//  MainButton.swift
//  SevenWindsTest
//
//  Created by Игорь on 13.03.2022.
//

import UIKit

final class MainButton: UIButton {

    enum ButtonType {
        case filled
        case outlined
    }

    // MARK: - Properties

    let type: ButtonType
    
    // MARK: - Lifecycle

    required init?(coder: NSCoder) {
        self.type = .filled
        super.init(coder: coder)
        prepareView()
    }

    init(type: ButtonType) {
        self.type = type
        super.init(frame: .zero)
        prepareView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2.0
    }

    private func prepareView() {
        switch type {
        case .filled:
            backgroundColor = R.color.main()
            setTitleColor(R.color.secondaryText(), for: .normal)
            titleLabel?.font = .systemFont(ofSize: 18.0, weight: .semibold)
        case .outlined:
            backgroundColor = .clear
            setTitleColor(R.color.mainText(), for: .normal)
            titleLabel?.font = .systemFont(ofSize: 15.0, weight: .regular)
        }
    }
}
