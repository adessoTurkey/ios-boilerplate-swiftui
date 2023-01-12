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

    func build(endpoint: Endpoint) -> String
    func request<T: Decodable>(with object: RequestObject, responseModel: T.Type, session: URLSessionProtocol) async throws -> Result<T, AdessoError>
//    func authenticatedRequest<T: Decodable>(with requestObject: RequestObject) -> Result<T, AdessoError>
}

extension AdessoServiceProtocol {

    func build(endpoint: Endpoint) -> String {
        endpoint.path
    }

    func request<T: Decodable>(with object: RequestObject, responseModel: T.Type, session: URLSessionProtocol) async throws -> Result<T, AdessoError> {
        await baseService.request(with: object, responseModel: responseModel)
    }
    
    //TODO: - how to handle authenticatedRequest with urlSession

//    func authenticatedRequest<T: Decodable>(with requestObject: RequestObject) async throws -> Result<T, AdessoError> {
//        var requestObject = requestObject
//        return await baseService.request(with: prepareAuthenticatedRequest(with: &requestObject))
//    }
//
//    private func prepareAuthenticatedRequest(with requestObject: inout RequestObject) -> RequestObject {
//        var adapters = requestObject.requestInterceptor?.adapters ?? []
//        adapters.append(build(requestAdapters: [.authAdapter]))
//        requestObject.requestInterceptor = Interceptor(adapters: adapters,
//                                                       retriers: requestObject.requestInterceptor?.retriers ?? [])
//        return requestObject
//    }
}
