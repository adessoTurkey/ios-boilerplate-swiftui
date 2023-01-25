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
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { throw AdessoError.badResponse }
        guard successCodeRange.contains(statusCode) else { throw AdessoError.httpError(status: HTTPStatus(rawValue: statusCode) ?? .notFound) }
        do {
            let decodedData = try decoder.decode(responseModel, from: data)
            return decodedData
        } catch {
            throw AdessoError.mappingFailed(data: data)
        }
    }

    private func prepareURLRequest(with requestObject: RequestObject) throws -> URLRequest {
        guard let url = URL(string: requestObject.url) else {
            throw AdessoError.badURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = requestObject.method.rawValue
        request.allHTTPHeaderFields = requestObject.headers
        request.httpBody = requestObject.body

        return request
    }
}
