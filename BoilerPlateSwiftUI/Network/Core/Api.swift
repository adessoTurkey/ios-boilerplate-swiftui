//
//  Api.swift
//  BoilerPlateSwiftUI
//
//  Created by Saglam, Fatih on 9.01.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

final class Api {
    struct Path {
        static let baseURL = Environment.baseURL
    }
}

protocol URLStringConvertible {
    var urlString: String { get }
}

protocol ApiPath: URLStringConvertible {
    static var path: String { get }
}

extension URL: URLStringConvertible {
    var urlString: String { return absoluteString }
}

extension Int: URLStringConvertible {
    var urlString: String { return String(describing: self) }
}

private func / (lhs: URLStringConvertible, rhs: URLStringConvertible) -> String {
    return lhs.urlString + "/" + rhs.urlString
}

extension String: URLStringConvertible {
    var urlString: String { return self }
}

extension CustomStringConvertible where Self: URLStringConvertible {
    var urlString: String { return description }
}
