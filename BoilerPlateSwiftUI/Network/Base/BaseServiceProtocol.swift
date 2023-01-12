//
//  BaseServiceProtocol.swift
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

protocol BaseServiceProtocol {
    func request<T: Decodable>(with requestObject: RequestObject, responseModel: T.Type, session: URLSessionProtocol,
                               decoder: JSONDecoder) async -> Result<T, AdessoError>
}

extension BaseServiceProtocol {
    func request<T: Decodable>(with requestObject: RequestObject, responseModel: T.Type, session: URLSessionProtocol = URLSession.shared,
                               decoder: JSONDecoder = JSONDecoder()) async -> Result<T, AdessoError> {
        guard let url = URL(string: requestObject.url) else { return .failure(.customError(1, "Bad url")) }
        
        var request = URLRequest(url: url)
        request.httpMethod = requestObject.method.rawValue
        request.allHTTPHeaderFields = requestObject.headers
        request.httpBody = requestObject.body
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { return .failure(.badResponse) }
            guard let decodedData = try? decoder.decode(responseModel, from: data) else { return .failure(.badResponse) }
            return.success(decodedData)
        } catch {
            return .failure(.badResponse)
        }
    }
}
