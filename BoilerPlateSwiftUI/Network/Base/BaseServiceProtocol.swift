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
    var session: URLSessionProtocol { get set }
    var decoder: JSONDecoder { get set }
    
    func request<T: Decodable>(with requestObject: RequestObject, responseModel: T.Type) async -> Result<T, AdessoError>
}

extension BaseServiceProtocol {
    func request<T: Decodable>(with requestObject: RequestObject, responseModel: T.Type) async -> Result<T, AdessoError> {
        guard let url = URL(string: requestObject.url) else { return .failure(.customError(1, "Bad url")) }
        var request = URLRequest(url: url)
        request.httpMethod = requestObject.method.rawValue
        request.allHTTPHeaderFields = requestObject.headers
        request.httpBody = requestObject.body
        
        do {
            let (data, response) = try await session.data(for: request, delegate: nil)
            let successCodeRange = 200...299
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
                  successCodeRange.contains(statusCode) else { return .failure(.badResponse) }
            let decodedData = try decoder.decode(responseModel, from: data)
            return .success(decodedData)
        } catch {
            return .failure(.unknown(error: error as NSError))
        }
    }
}
