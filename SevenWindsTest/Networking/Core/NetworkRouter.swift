//
//  NetworkRouter.swift
//  SevenWindsTest
//
//  Created by Игорь on 06.03.2022.
//

import Foundation

public typealias NetworkDataCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

final class NetworkRouter<E: Endpoint> {
    private var task: URLSessionTask?

    func request(_ endpoint: E, with completion: @escaping NetworkDataCompletion) {
        do {
            let request = try buildRequest(from: endpoint)
            task = URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    completion(data, response, error)
                }
            }
        } catch {
            DispatchQueue.main.async {
                completion(nil, nil, error)
            }
        }
        task?.resume()
    }

    func cancel() {
        task?.cancel()
    }

    private func buildRequest(from endpoint: E) throws -> URLRequest {
        var request = URLRequest(
            url: endpoint.baseURL.appendingPathComponent(endpoint.path),
            cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: 10.0
        )

        request.httpMethod = endpoint.method.rawValue

        switch endpoint.task {
        case .request:
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        case .requestWithParameters(let urlParameters, let bodyParameters):
            try request.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters)
        case .requestWithParametersAndHeaders(let urlParameters, let bodyParameters, let headers):
            request.addHeaders(headers: headers)
            try request.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters)
        }

        return request
    }
}

// MARK: - URLRequest+Extra

fileprivate extension URLRequest {
    mutating func configureParameters(bodyParameters: NetworkParameters?, urlParameters: NetworkParameters?) throws {
        do {
            if let bodyParameters = bodyParameters {
                try JSONParameterEncoder.encode(urlRequest: &self, with: bodyParameters)
            }
            if let urlParameters = urlParameters {
                try URLParameterEncoder.encode(urlRequest: &self, with: urlParameters)
            }
        } catch {
            throw error
        }
    }

    mutating func addHeaders(headers: HTTPHeaders?) {
        guard let headers = headers else { return }
        for (name, value) in headers {
            setValue(value, forHTTPHeaderField: name)
        }
    }
}

// MARK: - NetworkManager
struct NetworkManager: ResponseDecoder {
    private init() {}
}
