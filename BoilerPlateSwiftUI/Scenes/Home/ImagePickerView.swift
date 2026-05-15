//
//  ImagePickerView.swift
//  BoilerPlateSwiftUI
//
//  Created by Sucu, Ege on 10.02.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct ImagePickerView: View {

    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var shouldShowImagePicker = false
    @State private var selectedImage: Image?

    var imagePickerSources: [UIImagePickerController.SourceType] {
        UIImagePickerController.SourceType.allCases
    }

    var body: some View {
        VStack {
            VStack {
                Text(.sourceSelectTitle)
                    .font(.title3)
                    .bold()
                Picker("source_type", selection: $sourceType) {
                    ForEach(imagePickerSources, id: \.rawValue) { sourceType in
                        Text(sourceType.localizedText)
                            .tag(sourceType.rawValue)
                    }
                }
                .pickerStyle(.menu)
                .tint(.red)

            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 8)
            .padding(.bottom, 40)

            if sourceType == .photoLibrary || sourceType == .savedPhotosAlbum {
                PhotoPickerView(selectedImage: $selectedImage)
            } else {
                Button {
                    shouldShowImagePicker.toggle()
                } label: {
                    Text(sourceType == .camera ? .takePhoto : .selectPhoto)
                        .bigButtonText(backgroundColor: .green)
                }
            }

            if let selectedImage {
                selectedImage
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .padding(.all)
                    .shadow(radius: 8)
                Button {
                    self.selectedImage = nil
                } label: {
                    Text(.deleteImage)
                        .bigButtonText(backgroundColor: .red)
                }
            }
        }
        .sheet(
            isPresented: $shouldShowImagePicker,
            onDismiss: onImagePickerDismiss,
            content: imagePicker
        )
        .padding(.horizontal)
    }

    func imagePicker() -> some View {
        ImagePicker(
            sourceType: sourceType,
            compressQuality: 0.8,
            selectedImage: $selectedImage
        )
    }

    func onImagePickerDismiss() {
        // make an action after it's dismissed
    }
}

#if DEBUG

#Preview {
    ImagePickerView()
        .environment(\.locale, .init(identifier: "en"))
}

#Preview {
    ImagePickerView()
        .environment(\.locale, .init(identifier: "tr"))
}

#Preview {
    ImagePickerView()
        .environment(\.locale, .init(identifier: "de"))
}

#endif
