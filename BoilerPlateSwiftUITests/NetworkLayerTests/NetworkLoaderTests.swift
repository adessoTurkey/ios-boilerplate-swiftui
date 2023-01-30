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
        
    func test_init_doesNotRequest() {
        let (session, _) = makeSUT()
        
        XCTAssertTrue(session.requestedURLs.isEmpty)
    }
    
    func test_request_performsOneGETRequestWithRequestObject() {
        let (session, sut) = makeSUT()
        let url = anyURL()
        let requestObject = anyRequestObject(with: url.absoluteString)
        let expectation = expectation(description: "Wait for request")
        
        Task {
            _ = try? await sut.request(with: requestObject, responseModel: ExampleResponse.self)
            expectation.fulfill()
            
            XCTAssertEqual(session.requestedURLs, [url])
            XCTAssertEqual(session.requestMethods, ["GET"])
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func test_request_deliversErrorOnBadURL() {
        let (_, sut) = makeSUT()
        let url = "a bad url"
        let requestObject = anyRequestObject(with: url)
        
        expect(sut, toCompleteWith: .badURL(url), using: requestObject) { }
    }
    
    func test_request_deliversErrorOnRequestError() {
        let (session, sut) = makeSUT()

        expect(sut, toCompleteWith: .badResponse, using: anyRequestObject()) {
            session.completeWith(error: anyNSError())
        }
    }
    
    func test_request_deliversErrorOnNonOKHTTPStatusCode() {
        let (session, sut) = makeSUT()

        expect(sut, toCompleteWith: .httpError(status: .notFound), using: anyRequestObject()) {
            session.completeWith(httpStatusCode: 404)
        }
    }
    
    func test_request_deliversErrorOnNotValidStatusCode() {
        let (session, sut) = makeSUT()

        expect(sut, toCompleteWith: .httpError(status: .notValidCode), using: anyRequestObject()) {
            session.completeWith(httpStatusCode: 99)
        }
    }
    
    func test_request_deliversErrorOnInvalidData() {
        let (session, sut) = makeSUT()
        
        expect(sut, toCompleteWith: .mappingFailed(data: anyInvalidData()), using: anyRequestObject()) {
            session.completeWith(data: anyInvalidData())
        }
    }
    
    //MARK: - Helpers
    
    private func makeSUT() -> (URLSessionSpy, NetworkLoaderProtocol) {
        let session = URLSessionSpy()
        let sut = NetworkLoader()
        sut.session = session
        return (session, sut)
    }
    
    private func expect(_ sut: NetworkLoaderProtocol, toCompleteWith expectedError: AdessoError, using requestObject: RequestObject, when action: () -> Void, file: StaticString = #filePath, line: UInt = #line) {
        let expectation = expectation(description: "Wait for request")
        
        Task {
            do {
                _ = try await sut.request(with: requestObject, responseModel: ExampleResponse.self)
            } catch {
                let capturedError = error as? AdessoError
                XCTAssertEqual(capturedError, expectedError, file: file, line: line)
            }
            expectation.fulfill()
        }
        
        action()
        wait(for: [expectation], timeout: 1)
    }
    
    private func anyRequestObject(with url: String = "http://www.a-url.com") -> RequestObject {
        RequestObject(url: url)
    }
    
    func anyInvalidData() -> Data {
        Data("any invalid data".utf8)
    }
    
    private func anyURL() -> URL {
        URL(string: "http://www.a-url.com")!
    }

    private func anyNSError() -> NSError {
        NSError(domain: "any error", code: 0)
    }
    
    private class URLSessionSpy: URLSessionProtocol {
        var requestedURLs = [URL?]()
        var requestMethods = [String?]()
        var errors = [NSError]()
        var datas = [Data]()
        private(set) var statusCode = 200
        
        func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
            requestedURLs.append(request.url)
            requestMethods.append(request.httpMethod)
            if !errors.isEmpty {
                throw AdessoError.badResponse
            } else {
                let urlResponse = HTTPURLResponse(url: request.url!, statusCode: statusCode, httpVersion: nil, headerFields: nil)!
                return (datas.first ?? Data("any data".utf8), urlResponse)
            }
        }
        
        func completeWith(error: NSError, at index: Int = 0) {
            errors.append(error)
        }
        
        func completeWith(httpStatusCode: Int, at index: Int = 0) {
            self.statusCode = httpStatusCode
        }
        
        func completeWith(data: Data, at index: Int = 0) {
            datas.append(data)
        }
    }
}
