//
//  OnFirstAppearModifier.swift
//  BoilerPlateSwiftUI
//
//  Created by Said on 10.10.2022.
//  Copyright © 2022 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct OnFirstAppearModifier: ViewModifier {

    let perform: () -> Void
    @State private var firstTime: Bool = true

    func body(content: Content) -> some View {
        content.onAppear {
            if firstTime {
                firstTime = false
                self.perform()
            }
        }
    }
}

extension View {

    func onFirstAppear(perform: @escaping () -> Void) -> some View {
        self.modifier(OnFirstAppearModifier(perform: perform))
    }
}
