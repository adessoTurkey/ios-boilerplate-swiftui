//
//  ExampleUseCase.swift
//  BoilerPlateSwiftUI
//
//  Created by Saglam, Fatih on 12.01.2023.
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
        try await request(with: RequestObject(url: build(endpoint: .example(firstParameter: "",
                                                                  secondParameter: ""))),
                responseModel: ExampleResponse.self)
    }
}
    
enum ExampleServiceEndpoint: TargetEndpointProtocol {
    case example(firstParameter: String, secondParameter: String)
    
    private struct Constants {
        static let exampleEndpoint = "exampleEndpoint/%@/%@"
    }
    
    var path: String {
        switch self {
            case .example(let firstParameter, let secondParameter):
                return BaseEndpoint.base.path + String(format: Constants.exampleEndpoint, firstParameter, secondParameter)
            }
    }
}
