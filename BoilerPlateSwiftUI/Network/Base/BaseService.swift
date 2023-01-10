//
//  BaseService.swift
//  BoilerPlateSwiftUI
//
//  Created by Saglam, Fatih on 10.01.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

class BaseService: BaseServiceProtocol {

    func request<T: Decodable>(with requestObject: RequestObject,
                               decoder: JSONDecoder) async -> Result<T, AdessoError> {
        guard let url = URL(string: requestObject.url) else { return .failure(.customError(1, "Bad url")) }
        
        var request = URLRequest(url: url)
        request.httpMethod = requestObject.method.rawValue
        request.allHTTPHeaderFields = requestObject.headers
        request.httpBody = requestObject.body
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == HTTPStatus.okay.rawValue else { return .failure(.badResponse) }
            guard let decodedData = try? decoder.decode(T.self, from: data) else { return .failure(.badResponse) }
            return.success(decodedData)
        } catch {
            return .failure(.badResponse)
        }
    }
}
