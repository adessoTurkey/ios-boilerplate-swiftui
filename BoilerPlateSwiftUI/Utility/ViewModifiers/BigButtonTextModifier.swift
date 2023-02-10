//
//  BigButtonTextModifier.swift
//  BoilerPlateSwiftUI
//
//  Created by Sucu, Ege on 10.02.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct BigButtonTextModifier: ViewModifier {

    var backgroundColor: Color = .green

    func body(content: Content) -> some View {
        content
            .font(.title3)
            .foregroundColor(.white)
            .padding(.all)
            .background(backgroundColor)
            .cornerRadius(20)
            .shadow(radius: 8)
        }
}
