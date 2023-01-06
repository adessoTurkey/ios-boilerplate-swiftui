//
//  boilerplate-ios-swiftuiApp.swift
//  boilerplate-ios-swiftui
//
//  Created by Cagri Gider on 14.08.2022.
//  Copyright © 2022 Adesso Turkey. All rights reserved.
//

import SwiftUI

@main
struct BoilerPlateSwiftUIApp: App {
    // swiftlint:disable:next weak_delegate
    @UIApplicationDelegateAdaptor var delegate: BoilerPlateAppDelegate
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
