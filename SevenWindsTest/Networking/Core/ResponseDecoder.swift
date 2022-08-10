//
//  ResponseDecoder.swift
//  SevenWindsTest
//
//  Created by Игорь on 12.03.2022.
//

import Foundation

public enum DecoderError: Error {
    case connectionRefused
    case missingData
    case badResponse(code: Int)
    case decodingFailure
    case serverError(text: String)

    var description: String {
        switch self {
        case .connectionRefused:
            return "Нет интернет соединения"
        case .missingData:
            return "Нет данных от сервера"
        case .serverError(let text):
            return "Ошибка сервера: \(text)"
        case .badResponse:
            return "Неверный запрос"
        case .decodingFailure:
            return "Ошибка декодирования"
        }
    }
}

protocol ResponseDecoder {
    static func decode<T: Codable>(
        data: Data?,
        response: URLResponse?,
        error: Error?,
        type: T.Type
    ) -> Result<T, DecoderError>

    static func decode(data: Data?, response: URLResponse?, error: Error?) -> Result<Void, DecoderError>
}

extension ResponseDecoder {
    static func decode<T: Codable>(
        data: Data?,
        response: URLResponse?,
        error: Error?,
        type: T.Type
    ) -> Result<T, DecoderError> {
        guard error == nil, let response = response as? HTTPURLResponse else { return .failure(.connectionRefused) }
        guard let data = data else { return .failure(.missingData) }
        guard (200...299).contains(response.statusCode) else { return .failure(.badResponse(code: response.statusCode)) }
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(T.self, from: data)
            return .success(decodedData)
        } catch {
            return .failure(.decodingFailure)
        }
    }

    static func decode(data: Data?, response: URLResponse?, error: Error?) -> Result<Void, DecoderError> {
        guard error == nil, let response = response as? HTTPURLResponse else { return .failure(.connectionRefused) }
        guard data != nil else { return .failure(.missingData) }
        guard (200...299).contains(response.statusCode) else { return .failure(.badResponse(code: response.statusCode)) }
        return .success(())
    }
}
