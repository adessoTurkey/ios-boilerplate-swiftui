//
//  BaseServiceProtocol.swift
//  BoilerPlateSwiftUI
//
//  Created by Saglam, Fatih on 10.01.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

protocol BaseServiceProtocol {
    func request<T: Decodable>(with requestObject: RequestObject,
                               decoder: JSONDecoder) async throws -> Result<T, AdessoError>
}

extension BaseServiceProtocol {
    func request<T: Decodable>(with requestObject: RequestObject,
                               decoder: JSONDecoder = JSONDecoder()) async throws -> Result<T, AdessoError> {
        try await request(with: requestObject, decoder: decoder)
    }
}
