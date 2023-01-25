//
//  AdessoError.swift
//  BoilerPlateSwiftUI
//
//  Created by Saglam, Fatih on 10.01.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum AdessoError: Error, Equatable {
    case httpError(status: HTTPStatus, data: Data? = nil)
    case unknown(error: NSError)
    case customError(_ code: Int, _ message: String, _ data: Data? = nil)
    case mappingFailed
    case badResponse

    var errorCode: Int {
        switch self {
            case .httpError(let error, _):
                return error.rawValue
            case .unknown(let error):
                return error.code
            case .customError(let code, _, _):
                return code
            case .mappingFailed:
                return 0
            case .badResponse:
                return 0
        }
    }

    var response: ErrorResponse? {
        getResponse()
    }
}

extension AdessoError {
    private func getResponse() -> ErrorResponse? {
        switch self {
            case .httpError(_, let data), .customError(_, _, let data):
                if let data = data {
                    let response = try? JSONDecoder().decode(ErrorResponse.self, from: data)
                    return response
                }
                return nil
            case .badResponse, .mappingFailed, .unknown:
                return nil
        }
    }
}
