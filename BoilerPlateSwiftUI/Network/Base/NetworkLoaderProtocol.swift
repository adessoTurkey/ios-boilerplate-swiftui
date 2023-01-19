//
//  NetworkLoaderProtocol.swift
//  BoilerPlateSwiftUI
//
//  Created by Saglam, Fatih on 10.01.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol { }

protocol NetworkLoaderProtocol {
    var session: URLSessionProtocol { get set }
    var decoder: JSONDecoder { get set }

    func request<T: Decodable>(with requestObject: RequestObject, responseModel: T.Type) async throws -> T
}

extension NetworkLoaderProtocol {
    func request<T: Decodable>(with requestObject: RequestObject, responseModel: T.Type) async throws -> T {
        let (data, response) = try await session.data(for: prepareURLRequest(with: requestObject), delegate: nil)
        let successCodeRange = 200...299
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
              successCodeRange.contains(statusCode) else { throw AdessoError.httpError(status: .badRequest) }
        let decodedData = try decoder.decode(responseModel, from: data)
        return decodedData
    }

    private func prepareURLRequest(with requestObject: RequestObject) throws -> URLRequest {
        guard let url = URL(string: requestObject.url) else {
            throw AdessoError.customError(1, "Bad url")
        }
        var request = URLRequest(url: url)
        request.httpMethod = requestObject.method.rawValue
        request.allHTTPHeaderFields = requestObject.headers
        request.httpBody = requestObject.body

        return request
    }
}
