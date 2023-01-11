//
//  BaseServiceProvider.swift
//  BoilerPlateSwiftUI
//
//  Created by Saglam, Fatih on 11.01.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

class BaseServiceProvider {

    static let shared: BaseServiceProvider = BaseServiceProvider()

    let baseService: BaseServiceProtocol

    private init() {
        baseService = BaseService()
    }
}
