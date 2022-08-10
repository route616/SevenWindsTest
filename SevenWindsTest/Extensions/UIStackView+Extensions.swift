//
//  UIStackView+Extensions.swift
//  SevenWindsTest
//
//  Created by Игорь on 13.03.2022.
//

import Foundation
import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
