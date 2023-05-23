//
//  URLDefinitions.swift
//  BoilerPlateSwiftUI
//
//  Created by Sucu, Ege on 23.05.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct URLDefinitions {
    static let googleMapsAppStoreURL = URL(string: "https://apps.apple.com/us/app/google-maps/id585027354")
    static let googleMapsDeeplinkURL = URL(string: "comgooglemaps://")
    static let googleMapsLocationString = "comgooglemaps://?saddr=&daddr=%ld,%ld"
    static let yandexMapsAppStoreURL = URL(string: "https://itunes.apple.com/ru/app/yandex.navigator/id474500851")
    static let yandexMapsDeeplinkURL = URL(string: "yandexnavi://")
    static let yandexMapsLocationString = "yandexnavi://build_route_on_map?lat_to=%ld&lon_to=%ld"
}
