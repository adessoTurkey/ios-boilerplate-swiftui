//
//  MultiDevicePreviewView.swift
//  boilerplate_ios_swiftui
//
//  Created by Said on 6.11.2022.
//  Copyright © 2022 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct MultiDevicePreviewView<Content> : View where Content : View {

    let content: Content
    let devices: [Devices]

    init(devices: [Devices] = Devices.allCases, @ViewBuilder _ content: @escaping () -> Content) {
        self.content = content()
        self.devices = devices
    }

    var body: some View {
        ForEach(Devices.allCases, id: \.self) { deviceName in
            content
                .previewDevice(PreviewDevice(rawValue: deviceName.rawValue))
                .previewDisplayName(deviceName.rawValue)
        }
    }
}

struct MultiDevicePreviewView_Previews: PreviewProvider {
    static var previews: some View {
        MultiDevicePreviewView {
            Text("Test")
        }
    }
}

enum Devices: String, CaseIterable {
    case iPhone14Pro = "iPhone 14 Pro"
    case iPadPro9 = "iPad Pro (9.7-inch)"
}
