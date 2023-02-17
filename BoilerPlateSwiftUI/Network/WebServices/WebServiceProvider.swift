//
//  WebServiceProvider.swift
//  BoilerPlateSwiftUI
//
//  Created by Saglam, Fatih on 13.01.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

class WebServiceProvider {
    static let shared: WebServiceProvider = WebServiceProvider()

    let exampleService: ExampleServiceProtocol

    private init() {
        exampleService = ExampleService()
    }
}
