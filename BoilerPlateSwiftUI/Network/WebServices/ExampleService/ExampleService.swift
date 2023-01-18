//
//  ExampleService.swift
//  BoilerPlateSwiftUI
//
//  Created by Saglam, Fatih on 16.01.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

protocol ExampleServiceProtocol {
    func exampleRequest() async throws -> ExampleResponse
}

final class ExampleService: ExampleServiceProtocol, AdessoServiceProtocol {
    
    typealias Endpoint = ExampleServiceEndpoint
            
    let networkLoader: NetworkLoaderProtocol
    
    init(networkLoader: NetworkLoaderProtocol = NetworkLoaderProvider.shared.networkLoader) {
        self.networkLoader = networkLoader
    }
    
    func exampleRequest() async throws -> ExampleResponse {
        try await request(with: RequestObject(url: build(endpoint: .example(firstParameter: "firstParameter",
                                                                  secondParameter: "secondParameter"))),
                responseModel: ExampleResponse.self)
    }
}
