//
//  HomeView.swift
//  boilerplate-ios-swiftui
//
//  Created by Cagri Gider on 14.08.2022.
//  Copyright © 2022 Adesso Turkey. All rights reserved.
//

import SwiftUI
 #if canImport(Pulse)
 import PulseUI
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
            Button {
                showPulse.toggle()
                // Write a test function to make a fetch request in order to track Network activity.
            } label: {
                Text("Test Networking")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
            }.offset(.init(width: 0, height: 200))

        }
        .ignoresSafeArea()
        .sheet(isPresented: $showPulse) {
            NavigationView {
                #if canImport(Pulse)
                ConsoleView()
                    .navigationBarItems(leading: Button("Close") { showPulse = false })
                #endif
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
