//
//  RequestObject.swift
//  BoilerPlateSwiftUI
//
//  Created by Saglam, Fatih on 10.01.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct RequestObject {
    var url: String
    let method: HTTPMethod
    var data: Encodable?
    var headers: [String: String]?
    var body: Data?

    init(url: String,
         method: HTTPMethod = .get,
         data: Encodable? = nil,
         headers: [String: String] = [:],
         body: Data? = nil) {
        self.url = url
        self.method = method
        self.data = data
        self.headers = headers
        self.body = body
    }
}

enum HTTPMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
}
