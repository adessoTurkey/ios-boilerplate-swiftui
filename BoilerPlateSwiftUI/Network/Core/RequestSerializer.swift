//
//  RequestSerializer.swift
//  BoilerPlateSwiftUI
//
//  Created by Saglam, Fatih on 9.01.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

public enum ClientError: Error {
    case invalidURL
    case invalidRequest
    case invalidResponse
}

extension ApiManager {
    func urlRequest(
        url: URLStringConvertible,
        parameters: [String: String] = [:],
        method: HttpMethod = .get,
        headers: [String: String] = [:],
        body: Data? = nil) throws -> URLRequest {
            guard let url = URL(string: url.urlString) else { throw ClientError.invalidURL }
            
            guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
                throw ClientError.invalidRequest
            }
            
            components.queryItems = parameters.map { URLQueryItem(name: $0, value: $1) }
            
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            request.allHTTPHeaderFields = headers
            request.httpBody = body
            
            return request
        }
}

struct HttpMethod: RawRepresentable {
    let rawValue: String
    
    init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    static let get = Self(rawValue: "GET")
    static let post = Self(rawValue: "POST")
    static let put = Self(rawValue: "PUT")
    static let patch = Self(rawValue: "PATCH")
    static let delete = Self(rawValue: "DELETE")
    static let head = Self(rawValue: "HEAD")
}

