//
//  AdessoServiceProtocol.swift
//  BoilerPlateSwiftUI
//
//  Created by Saglam, Fatih on 11.01.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

protocol AdessoServiceProtocol {
    associatedtype Endpoint: TargetEndpointProtocol

    var baseService: BaseServiceProtocol { get }

    func request<T: Decodable>(with requestObject: RequestObject, responseModel: T.Type) async throws -> T
    func authenticatedRequest<T: Decodable>(with requestObject: RequestObject, responseModel: T.Type) async throws -> T
}

extension AdessoServiceProtocol {

    func request<T: Decodable>(with requestObject: RequestObject, responseModel: T.Type) async throws -> T {
        try await baseService.request(with: requestObject, responseModel: responseModel)
    }
    
    func build(endpoint: Endpoint) -> String {
        endpoint.path
    }
    
    func authenticatedRequest<T: Decodable>(with requestObject: RequestObject, responseModel: T.Type) async throws -> T {
        var requestObject = requestObject
        return try await baseService.request(with: prepareAuthenticatedRequest(with: &requestObject), responseModel: responseModel)
    }
    
    private func prepareAuthenticatedRequest(with requestObject: inout RequestObject) -> RequestObject {
        #warning("This does not return an authenticated request")
        //TODO: - how to handle authenticatedRequest with urlSession

        return requestObject
    }
}
