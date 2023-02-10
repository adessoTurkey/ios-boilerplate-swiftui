//
//  HomeView.swift
//  boilerplate-ios-swiftui
//
//  Created by Cagri Gider on 14.08.2022.
//  Copyright © 2022 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.red
            VStack {
                Text("Hello, World!")
                    .font(.largeTitle)
                    .bold()
                /// You can use the code block below to test out the old & new photo picker.
//                ImagePickerView()
//                    .padding(.all)
//                    .background(Color.white)
//                    .cornerRadius(10)
//                    .shadow(radius: 8)
//                    .padding(.all)
            }
        }
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
