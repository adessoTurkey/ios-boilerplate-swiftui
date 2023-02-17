//
//  EndpointBuilder.swift
//  BoilerPlateSwiftUI
//
//  Created by Saglam, Fatih on 11.01.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

class EndpointBuilder {

    init() { }

    func build<T: TargetEndpointProtocol>(with targetEndpoint: T) -> String {
        targetEndpoint.path
    }
}
