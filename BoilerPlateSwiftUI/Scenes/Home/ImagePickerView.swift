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

    var body: some View {

        VStack {
            VStack {
                Text("source_select_title")
                    .font(.title3)
                    .bold()
                Picker("Source Type", selection: $sourceType) {
                    ForEach(UIImagePickerController.SourceType.allCases, id: \.self) { sourceType in
                        Text(sourceType
                            .text()
                            .localized)
                        .tag(sourceType.rawValue)
                    }
                }
                .tint(.red)
            }
            .padding(.all)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 8)
            .padding(.bottom, 40)

            if #available(iOS 16, *) {
                if sourceType == .photoLibrary || sourceType == .savedPhotosAlbum {
                    NewPhotoPickerView(selectedImage: $selectedImage)
                } else {
                    Button {
                        shouldShowImagePicker.toggle()
                    } label: {
                        Text(sourceType == .camera ? "take_photo" : "select_photo")
                            .modifier(BigButtonTextModifier(backgroundColor: .green))
                    }
                }
            } else {
                Button {
                    shouldShowImagePicker.toggle()
                } label: {
                    Text(sourceType == .camera ? "take_photo" : "select_photo")
                        .modifier(BigButtonTextModifier(backgroundColor: .green))
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
                    Text("delete_image")
                        .modifier(BigButtonTextModifier(backgroundColor: .red))
                }
            }
        }
        .sheet(isPresented: $shouldShowImagePicker, onDismiss: {
            // make an action after it's dismissed
        }, content: {
            ImagePicker(sourceType: sourceType, compressQuality: 0.8, selectedImage: $selectedImage)
        })
    }
}

struct ImagePickerView_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            ImagePickerView()
            ImagePickerView()
                .environment(\.locale, .init(identifier: "tr"))
            ImagePickerView()
                .environment(\.locale, .init(identifier: "de"))
        }

    }
}

extension UIImagePickerController.SourceType: CaseIterable {
    public static var allCases: [UIImagePickerController.SourceType] {
        [.camera, .photoLibrary, .savedPhotosAlbum]
    }

    func text() -> String {
        switch self.rawValue {
            case 0:
                return "source_library"
            case 1:
                return "source_camera"
            case 2:
                return "source_saved_album"
            default:
                return ""
        }
    }
}
