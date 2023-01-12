//
//  BaseServiceTests.swift
//  BoilerPlateSwiftUITests
//
//  Created by Saglam, Fatih on 11.01.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.

// swiftlint:disable all

import XCTest
@testable import BoilerPlateSwiftUI

final class BaseServiceTests: XCTestCase {
    
    func test_request_performsOneGETRequestWithRequestObject() {
        let sut = makeSUT()
        let session = URLSessionSpy()
        let requestObject = RequestObject(url: "http://www.a-url.com")
        let expectation = expectation(description: "Wait for request")
        
        Task {
            _ = await sut.exampleRequest(with: requestObject, responseModel: ResponseModel.self, session: session)
            expectation.fulfill()
            
            XCTAssertEqual(session.requestedURL?.absoluteString, requestObject.url)
            XCTAssertEqual(session.dataForRequestCallCount, 1)
            XCTAssertEqual(session.requestMethod, "GET")
        }
        
        wait(for: [expectation], timeout: 5)

    }
    
    //MARK: - Helpers
    
    private func makeSUT() -> ExampleService {
        let sut = ExampleService()
        return sut
    }
    
    class ExampleService: AdessoServiceProtocol {
        
        typealias Endpoint = ExampleServiceEndpoint
        
        let baseService: BaseServiceProtocol
        
        init(baseService: BaseServiceProtocol = BaseServiceProvider.shared.baseService) {
            self.baseService = baseService
        }
        
        func exampleRequest(with requestObject: RequestObject, responseModel: ResponseModel.Type, session: URLSessionProtocol) async -> Result<ResponseModel, AdessoError> {
            do {
                let result = try await request(with: requestObject, responseModel: responseModel, session: session)
                return result
            } catch {
                return .failure(.mappingFailed)
            }
        }
    }
    
    
    struct ResponseModel: Decodable {}
    
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
    
    private class URLSessionSpy: URLSessionProtocol {
        var dataForRequestCallCount = 0
        var requestedURL: URL?
        var requestMethod: String?
        
        func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
            dataForRequestCallCount += 1
            requestedURL = request.url
            requestMethod = request.httpMethod
            return (Data(), URLResponse())
        }
    }
}

