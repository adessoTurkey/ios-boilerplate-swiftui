//
//  ExampleService.swift
//  BoilerPlateSwiftUI
//
//  Created by Saglam, Fatih on 16.01.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

protocol ExampleServiceProtocol {
    func exampleRequest() async throws -> Result<ExampleResponse, AdessoError>
}

final class ExampleService: ExampleServiceProtocol, AdessoServiceProtocol {
    
    typealias Endpoint = ExampleServiceEndpoint
            
    let baseService: BaseServiceProtocol
    
    init(baseService: BaseServiceProtocol = BaseServiceProvider.shared.baseService) {
        self.baseService = baseService
    }
    
    func exampleRequest() async throws -> Result<ExampleResponse, AdessoError> {
        try await request(with: RequestObject(url: build(endpoint: .example(firstParameter: "firstParameter",
                                                                  secondParameter: "secondParameter"))),
                responseModel: ExampleResponse.self)
    }
}
