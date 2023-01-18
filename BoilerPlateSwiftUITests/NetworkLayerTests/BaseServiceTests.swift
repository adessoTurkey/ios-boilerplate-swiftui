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
            _ = try? await sut.request(with: requestObject, responseModel: ExampleResponse.self)
            expectation.fulfill()
            
            XCTAssertEqual(session.requestedURL?.absoluteString, requestObject.url)
            XCTAssertEqual(session.dataForRequestCallCount, 1, "expected 1, received \(session.dataForRequestCallCount) instead")
            XCTAssertEqual(session.requestMethod, "GET", "expected GET, get \(session.requestMethod ?? "") instead.")
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func test_request_failsOnRequestError() {
        let session = URLSessionSpy()
        let service = BaseServiceMock(session: session)
        let sut = makeSUT(service: service)
        let requestObject = RequestObject(url: anyURL())
        let anyError = anyNSError()
        let expectation = expectation(description: "Wait for request")
        session.completeWith(error: anyNSError())
        
        Task {
            do {
                _ = try await sut.request(with: requestObject, responseModel: ExampleResponse.self)
            } catch {
                let capturedError = error as NSError
                XCTAssertEqual(capturedError.domain, anyError.domain)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func test_request_failsOnNonOKHTTPStatusCode() {
        let session = URLSessionSpy()
        let service = BaseServiceMock(session: session)
        let sut = makeSUT(service: service)
        let requestObject = RequestObject(url: anyURL())
        let expectation = expectation(description: "Wait for request")
        session.completeWith(httpStatusCode: 199)
        
        Task {
            do {
                _ = try await sut.request(with: requestObject, responseModel: ExampleResponse.self)
            } catch {
                let capturedError = error as NSError
                XCTAssertNotNil(capturedError)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    //MARK: - Helpers
    
    private func makeSUT(service: BaseServiceProtocol) -> ExampleService {
        ExampleService(baseService: service)
    }
    
    private func anyURL() -> String {
        return "http://www.a-url.com"
    }
    
    private func anyNSError() -> NSError {
        NSError(domain: "any error", code: 0)
    }
    
    private class URLSessionSpy: URLSessionProtocol {
        var dataForRequestCallCount = 0
        var requestedURL: URL?
        var requestMethod: String?
        private(set) var error: NSError?
        private(set) var statusCode: Int = 200
        
        func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
            dataForRequestCallCount += 1
            requestedURL = request.url
            requestMethod = request.httpMethod
            if let error {
                throw error
            } else {
                let urlResponse = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
                return (Data("any data".utf8), urlResponse)
            }
        }
        
        func completeWith(error: NSError) {
            self.error = error
        }
        
        func completeWith(httpStatusCode: Int) {
            self.statusCode = httpStatusCode
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

