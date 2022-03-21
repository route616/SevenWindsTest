//
//  MainTableViewCellProtocols.swift
//  SevenWindsTest
//
//  Created by Игорь on 18.03.2022.
//

import Foundation

protocol MainTableViewCellInput: AnyObject {
    var title: String? { get set }
    var subtitle: String? { get set }
    var isCountable: Bool { get set }
}

protocol MainTableViewCellOutput: AnyObject {
    func didChanged(_ count: Int)
}
