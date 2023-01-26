//
//  TestExtensions.swift
//  BoilerPlateSwiftUI
//
//  Created by Saglam, Fatih on 26.01.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//
// swiftlint:disable all

import XCTest
import Foundation

extension Dictionary where Value: Any, Key == String {
    func isEqualTo(json: [String: Any]) -> Bool {
        return NSDictionary(dictionary: self).isEqual(to: json)
    }
}

extension Encodable {
    func toJSONDictionary() throws -> [String: AnyHashable] {
        let data = try JSONEncoder().encode(self)
        let jsonObject = try JSONSerialization.jsonObject(with: data)
        guard let jsonDictionary = jsonObject as? [String: AnyHashable] else {
            let context = DecodingError.Context(codingPath: [], debugDescription: "Unable to convert JSON object \(jsonObject) to [String: AnyHashable]")
            throw DecodingError.typeMismatch([String: AnyHashable].self, context)
        }
        return jsonDictionary
    }
}

extension String {
    func decodedJSONObject<T>(ofType type: T.Type) throws -> T where T: Decodable {
        let decoder = JSONDecoder()
        return try decoder.decode(type, from: self.data(using: .utf8)!)
    }
    
    func concatenate(string stringProvider: @autoclosure () -> String) -> String {
        return self + stringProvider()
    }
}

extension DecodingError: Equatable {
    public static func == (lhs: DecodingError, rhs: DecodingError) -> Bool {
        switch (lhs, rhs) {
        case (DecodingError.keyNotFound(let lKey, _), DecodingError.keyNotFound(let rKey, _)):
            return lKey.stringValue == rKey.stringValue
        default:
            // We need a default case to return false for different case combinations.
            // By falling back to domain and code based comparison, we ensure that
            // as soon as we add additional error cases, we have to revisit only the
            // Equatable implementation, if the case has an associated value.
            return lhs._domain == rhs._domain
            && lhs._code == rhs._code
        }
    }}

class JSONHelper {
    static func load(from filename: String) -> Data {
        let ext = "json"
        let bundle = Bundle(for: self)
        let url = bundle.url(forResource: filename, withExtension: ext)!
        guard let data = try? Data(contentsOf: url) else {
            fatalError("File \(filename).\(ext) not found in URL \(url)")
        }
        return data
    }
}
