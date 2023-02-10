//
//  NewPhotoPickerView.swift
//  BoilerPlateSwiftUI
//
//  Created by Sucu, Ege on 10.02.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI
import PhotosUI

@available(iOS 16.0, *)
struct NewPhotoPickerView: View {

    @State private var selectedItem: PhotosPickerItem?
    @Binding var selectedImage: Image?
    var body: some View {
        VStack {
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()) {
                    Text("select_photo")
                        .modifier(BigButtonTextModifier(backgroundColor: .green))
                }
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self),
                           let uiImage = UIImage(data: data) {
                            selectedImage = Image(uiImage: uiImage)
                        }
                    }
                }
        }
    }
}
