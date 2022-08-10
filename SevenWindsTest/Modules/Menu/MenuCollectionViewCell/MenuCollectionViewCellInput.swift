//
//  MenuCollectionViewCellInput.swift
//  SevenWindsTest
//
//  Created by Игорь on 21.04.2022.
//

import Foundation

protocol MenuCollectionViewCellInput: AnyObject {
    var title: String? { get set }
    var subtitle: String? { get set }
    var isCountable: Bool { get set }
    var handler: ((UInt) -> Void)? { get set }
    func setImage(from data: Data)
    func setPlaceholderImage()
    func startAnimating()
    func stopAnimating()
}
