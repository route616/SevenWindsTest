//
//  UIView+Extensions.swift
//  SevenWindsTest
//
//  Created by Игорь on 14.03.2022.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }

    func addShadow(color: UIColor = .black, offset: CGSize = .zero, radius: CGFloat = 5.0, opacity: Float = 0.5) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}
