//
//  HomeView.swift
//  boilerplate-ios-swiftui
//
//  Created by Cagri Gider on 14.08.2022.
//  Copyright © 2022 Adesso Turkey. All rights reserved.
//

import SwiftUI
#if PULSE
import PulseUI
import Pulse
#endif

struct HomeView: View {
    @State private var showPulse = false
    var body: some View {
        ZStack {
            Color.red
            VStack {
                Text("Hello, World!")
                    .font(.largeTitle)
                    .bold()
                // You can use the code block below to test out the old & new photo picker.
                //                ImagePickerView()
                //                    .padding(.all)
                //                    .background(Color.white)
                //                    .cornerRadius(10)
                //                    .shadow(radius: 8)
                //                    .padding(.all)
            }
            #if PULSE
            Button {
                showPulse.toggle()
                // Write a test function to make a fetch request in order to track Network activity.
                Task { @MainActor in
                    await self.runTestConnection()
                }
            } label: {
                Text("Test Networking")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
            }.offset(.init(width: 0, height: 200))
            #endif

        }
        .ignoresSafeArea()
        .sheet(isPresented: $showPulse) {
            NavigationView {
               pulseView()
            }
        }
    }

    private func runTestConnection() async {
#if PULSE
        do {
            let demoSession = URLSessionProxy(configuration: .default)
            // swiftlint:disable:next force_unwrapping
            let url = URL(string: "https://www.adesso.com.tr")!
            let result = try await demoSession.data(from: url)
            Logger().info("We have data: \(result.0)")
        } catch {
            Logger().error("URL could not be fetched \(error.localizedDescription)")
        }
#endif
    }

    @ViewBuilder
    func pulseView() -> some View {
    #if PULSE
        ConsoleView()
            .navigationBarItems(leading: Button("Close") { showPulse = false })
    #else
        EmptyView()
    #endif
    }

}

#Preview {
    HomeView()
}
