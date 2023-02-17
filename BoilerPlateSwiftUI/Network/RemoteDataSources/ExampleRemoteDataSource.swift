//
//  ExampleRemoteDataSource.swift
//  BoilerPlateSwiftUI
//
//  Created by Saglam, Fatih on 13.01.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

protocol ExampleRemoteDataSourceProtocol {
    func getExample() async throws -> ExampleResponse
}

class ExampleRemoteDataSource: ExampleRemoteDataSourceProtocol {

    let exampleService: ExampleServiceProtocol

    init(exampleService: ExampleServiceProtocol = WebServiceProvider.shared.exampleService) {
        self.exampleService = exampleService
    }

    func getExample() async throws -> ExampleResponse {
        try await exampleService.exampleRequest()
    }
}
