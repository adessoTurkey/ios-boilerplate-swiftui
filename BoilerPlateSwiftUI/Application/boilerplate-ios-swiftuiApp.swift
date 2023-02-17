//
//  boilerplate-ios-swiftuiApp.swift
//  boilerplate-ios-swiftui
//
//  Created by Cagri Gider on 14.08.2022.
//  Copyright © 2022 Adesso Turkey. All rights reserved.
//

import SwiftUI
#if PULSE
import Pulse
#endif

@main
struct BoilerPlateSwiftUIApp: App {
    @Environment(\.scenePhase) private var phase
    // Check out https://developer.apple.com/documentation/swiftui/scenephase for more information
    private var loggingService: LoggingService

    init() {
    #if PULSE
        Experimental.URLSessionProxy.shared.isEnabled = true
        URLSessionProxyDelegate.enableAutomaticRegistration()
    #endif
        loggingService = LoggingService()
    }

    var body: some Scene {
        WindowGroup {
            MainView()
                .onChange(of: phase, perform: manageChanges(for:))
                .onOpenURL(perform: onOpenURL(_:))
        }
    }

    private func manageChanges(for phase: ScenePhase) {
        switch phase {
            case .active:
                // App became active
                activated()
            case .background:
                // App is running in the background
                backgrounded()
            case .inactive:
                // App became inactive
                deactivated()
            @unknown default:
                // Fallback for future cases
                break
        }
    }
}

// MARK: - App Life Cycle
extension BoilerPlateSwiftUIApp {
    func activated() {}
    func backgrounded() {}
    func deactivated() {}
    func onOpenURL(_ url: URL) {} // URL Opening management. Same as AppDelegate's `application(_:open:options:)`
}
