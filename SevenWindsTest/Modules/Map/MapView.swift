//
//  MapView.swift
//  SevenWindsTest
//
//  Created by Игорь on 24.04.2022.
//

import Foundation
import UIKit
import YandexMapKit
import SnapKit

final class MapView: BaseViewController {

    // MARK: - Views

    private lazy var mapView: YMKMapView = {
        let view = YMKMapView()
        return view
    }()

    // MARK: - Lifecycle

    override func setupView() {
        view.addSubview(mapView)
    }

    override func setupConstraints() {
        mapView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - ViewInput

extension MapView: MapViewInput {
    func update() {

    }
}
