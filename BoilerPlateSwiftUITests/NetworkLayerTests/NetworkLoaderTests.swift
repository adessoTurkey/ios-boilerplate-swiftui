//
//  NetworkLoaderTests.swift
//  BoilerPlateSwiftUITests
//
//  Created by Saglam, Fatih on 11.01.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.

// swiftlint:disable all

import XCTest
@testable import BoilerPlateSwiftUI

final class NetworkLoaderTests: XCTestCase {
    
    func test_request_performsOneGETRequestWithRequestObject() {
        let session = URLSessionSpy()
        let sut = makeSUT(session: session)
        let url = anyURL()
        let requestObject = RequestObject(url: url.absoluteString)
        let expectation = expectation(description: "Wait for request")
        
        Task {
            _ = try? await sut.request(with: requestObject, responseModel: ExampleResponse.self)
            expectation.fulfill()
            
            XCTAssertEqual(session.requestedURLs, [url])
            XCTAssertEqual(session.requestMethods, ["GET"])
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func test_request_failsOnRequestError() {
        let session = URLSessionSpy()
        let sut = makeSUT(session: session)
        let url = anyURL()
        let requestObject = RequestObject(url: url.absoluteString)
        let anyError = anyNSError()
        let expectation = expectation(description: "Wait for request")
        
        Task {
            do {
                _ = try await sut.request(with: requestObject, responseModel: ExampleResponse.self)
            } catch {
                let capturedError = error as NSError
                XCTAssertEqual(capturedError.domain, anyError.domain)
            }
            expectation.fulfill()
        }
        
        session.completeWith(error: anyNSError())
        wait(for: [expectation], timeout: 1)
    }
    
    func test_request_failsOnNonOKHTTPStatusCode() {
        let session = URLSessionSpy()
        let sut = makeSUT(session: session)
        let url = anyURL()
        let requestObject = RequestObject(url: url.absoluteString)
        let expectation = expectation(description: "Wait for request")
        
        Task {
            do {
                _ = try await sut.request(with: requestObject, responseModel: ExampleResponse.self)
            } catch {
                let capturedError = error as? AdessoError
                XCTAssertEqual(capturedError?.errorCode, AdessoError.badResponse.errorCode)
            }
            expectation.fulfill()
        }
        
        session.completeWith(httpStatusCode: 199)
        wait(for: [expectation], timeout: 1)
    }
    
    //MARK: - Helpers
    
    private func makeSUT(session: URLSessionProtocol) -> NetworkLoaderProtocol {
        let loader = NetworkLoader()
        loader.session = session
        return loader
    }
    
    private func anyURL() -> URL {
        return URL(string: "http://www.a-url.com")!
    }
    
    private func anyNSError() -> NSError {
        NSError(domain: "any error", code: 0)
    }
    
    private class URLSessionSpy: URLSessionProtocol {
        var requestedURLs = [URL?]()
        var requestMethods = [String?]()
        var errors = [NSError]()
        private(set) var statusCode = 200
        
        func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
            requestedURLs.append(request.url)
            requestMethods.append(request.httpMethod)
            if !errors.isEmpty {
                throw errors.last!
            } else {
                let urlResponse = HTTPURLResponse(url: request.url!, statusCode: statusCode, httpVersion: nil, headerFields: nil)!
                return (Data("any data".utf8), urlResponse)
            }
        }
        
        func completeWith(error: NSError, at index: Int = 0) {
            errors.append(error)
        }
        
        func completeWith(httpStatusCode: Int) {
            self.statusCode = httpStatusCode
        }
    }
}

