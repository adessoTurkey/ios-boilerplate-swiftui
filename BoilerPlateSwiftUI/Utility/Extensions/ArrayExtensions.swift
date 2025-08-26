//
//  ArrayExtensions.swift
//  BoilerPlateSwiftUI
//
//  Created by Sucu, Ege on 12.04.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

/// A wrapper for arrays that enables RawRepresentable conformance via JSON encoding/decoding.
public struct RawCodableArray<Element: Codable>: RawRepresentable, Codable {
    public var elements: [Element]

    public init(_ elements: [Element]) {
        self.elements = elements
    }

    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self.elements = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(elements),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
