//
//  URLExtensions.swift
//  BoilerPlateSwiftUI
//
//  Created by Sucu, Ege on 23.05.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import UIKit
import MapKit

// MARK: - Map URL Extension
/// This extension is designed to open any location with users favorite map application.
///
extension URL {

    func openURLWithMap(latitude: CGFloat, longitude: CGFloat, application: MapApplication) {

        switch application {
            case .google:
            guard let deeplink = URLDefinitions.googleDeeplinkURL else { return }
                if UIApplication.shared.canOpenURL(deeplink) {
                    let url = URL(string: String(format: "google_maps_url", latitude, longitude))
                    if let url {
                        UIApplication.shared.open(url)
                    }
                } else {
                    if let url = URLDefinitions.googleMapsAppStoreURL {
                        UIApplication.shared.open(url)
                    }
                }
            case .apple:
                let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                let placemark = MKPlacemark(coordinate: coordinate)
                let item = MKMapItem(placemark: placemark)
                item.openInMaps()
            case .yandex:
                guard let deeplink = URLDefinitions.yandexMapsDeeplinkURL else { return }
                if UIApplication.shared.canOpenURL(deeplink) {
                    let url = URL(string: String(format: "yandex_maps_url", latitude, longitude))
                    if let url {
                        UIApplication.shared.open(url)
                    }
                } else {
                    if let url = URLDefinitions.yandexMapsAppStoreURL {
                        UIApplication.shared.open(url)
                    }
                }
        }
    }
}

enum MapApplication: String {
    case google = "Google Maps"
    case apple = "Maps"
    case yandex = "Yandex Maps"
}
