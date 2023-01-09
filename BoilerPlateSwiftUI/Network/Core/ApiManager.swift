//
//  ApiManager.swift
//  BoilerPlateSwiftUI
//
//  Created by Saglam, Fatih on 9.01.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

let api = ApiManager()

final class ApiManager {

    var defaultHTTPHeaders: [String: String] {
        let headers: [String: String] = [:]
        return headers
    }
}
