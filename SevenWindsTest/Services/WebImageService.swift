//
//  WebImageService.swift
//  SevenWindsTest
//
//  Created by Игорь on 23.03.2022.
//

import Foundation

final class WebImageService {
    static let shared = WebImageService()
    private init() {}

    static func downloadImage(from urlAddress: String, with completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlAddress) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                completion(data)
            }
        }.resume()
    }
}
