//
//  ViewExtensions.swift
//  BoilerPlateSwiftUI
//
//  Created by Sucu, Ege on 15.05.26.
//  Copyright © 2026 Adesso Turkey. All rights reserved.
//

import SwiftUI

extension View {
    func stickyBottomView(@ViewBuilder view: () -> some View) -> some View {
        self
            .safeAreaInset(edge: .bottom, content: view)
    }
}
