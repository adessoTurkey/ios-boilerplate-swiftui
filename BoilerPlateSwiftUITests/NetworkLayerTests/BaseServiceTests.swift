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
        let session = URLSessionSpy()
        let service = BaseServiceMock(session: session)
        let sut = makeSUT(service: service)
        let requestObject = RequestObject(url: anyURL())
        let expectation = expectation(description: "Wait for request")
        
        Task {
            _ = try await sut.request(with: requestObject, responseModel: ExampleResponse.self)
            expectation.fulfill()
            
            XCTAssertEqual(session.requestedURL?.absoluteString, requestObject.url, "expected \(requestObject.url), received \(session.requestedURL) instead.")
            XCTAssertEqual(session.dataForRequestCallCount, 1, "expected 1, received \(session.dataForRequestCallCount) instead")
            XCTAssertEqual(session.requestMethod, "GET", "expected GET, get \(session.requestMethod ?? "") instead.")
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    //MARK: - Helpers
    
    private func makeSUT(service: BaseServiceProtocol) -> ExampleService {
        ExampleService(baseService: service)
    }
    
    private func anyURL() -> String {
        return "http://www.a-url.com"
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
    
    private class BaseServiceMock: BaseServiceProtocol {
        var session: URLSessionProtocol
        var decoder: JSONDecoder = JSONDecoder()
        
        init(session: URLSessionProtocol) {
            self.session = session
        }
    }
}

