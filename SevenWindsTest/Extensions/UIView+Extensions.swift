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
}
